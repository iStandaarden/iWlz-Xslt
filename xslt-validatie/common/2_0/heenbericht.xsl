<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:template name="formatNumberInternal">
		<xsl:param name="pValue"/>
		<xsl:if test="$pValue &gt; 0">
			<xsl:call-template name="formatNumberInternal">
				<xsl:with-param name="pValue" select="floor(number($pValue) div 10)"/>
			</xsl:call-template>
			<xsl:value-of select="number($pValue) mod 10"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="formatNumber">
		<xsl:param name="pValue"/>
		<xsl:choose>
			<xsl:when test="number($pValue) &lt; 0">-
				<xsl:call-template name="formatNumberInternal">
					<xsl:with-param name="pValue" select="0 - number($pValue)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="number($pValue) = 0">0</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="formatNumberInternal">
					<xsl:with-param name="pValue" select="number($pValue)"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="*" mode="mapMessage" priority="100">
		<xsl:param name="pMessage" />
		<xsl:choose>
			<xsl:when test="$pMessage = 'aw310'">aw39</xsl:when>
			<xsl:when test="$pMessage = 'zk310'">zk39</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="vType"><xsl:value-of select="translate($pMessage, '0123456789', '')" /></xsl:variable>
				<xsl:variable name="vNumber"><xsl:value-of select="translate($pMessage, $vType, '')" /></xsl:variable>
				<xsl:value-of select="$vType" /><xsl:value-of select="1 * $vNumber - 1" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="mapNamespace">
		<xsl:param name="pNamespace"/>
		<xsl:variable name="vMessage"><xsl:value-of select="substring-before(substring-after(substring-after(substring-after($pNamespace, 'http://www.istandaarden.nl/'), '/'), '/'), '/')"/></xsl:variable>
		<xsl:variable name="vPrefix"><xsl:value-of select="substring-before($pNamespace, $vMessage)"/></xsl:variable>
		<xsl:variable name="vSuffix"><xsl:value-of select="substring-after($pNamespace, $vMessage)"/></xsl:variable>
		<xsl:choose>
			<xsl:when test="$vMessage = 'basisschema'"><xsl:value-of select="$pNamespace" /></xsl:when>
			<xsl:otherwise><xsl:value-of select="$vPrefix" /><xsl:apply-templates select="." mode="mapMessage">
					<xsl:with-param name="pMessage" select="$vMessage" />
			</xsl:apply-templates><xsl:value-of select="$vSuffix" /></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="*" mode="postoverride" priority="0">
	</xsl:template>

	<xsl:template match="*[local-name() = 'IdentificatieRetour']" priority="10"></xsl:template>
	<xsl:template match="*[local-name() = 'DagtekeningRetour']" priority="10"></xsl:template>
	<xsl:template match="*[local-name() = 'XsdVersieRetour']" priority="10"></xsl:template>
	<xsl:template match="*[local-name() = 'RetourCodes']" priority="10"></xsl:template>
	<xsl:template match="*[local-name() = 'RetourHeader']" priority="10"></xsl:template>
	<xsl:template match="*[local-name() = 'RetourBedragen']" priority="10"></xsl:template>
	<xsl:template match="*[local-name() = 'ToegekendeBedragPrestatie']" priority="10"></xsl:template>

	<xsl:template match="*[local-name() = 'BerichtCode']" priority="10">
		<xsl:variable name="vNamespace">
			<xsl:call-template name="mapNamespace">
				<xsl:with-param name="pNamespace" select="namespace-uri()" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:element name="{local-name()}" namespace="{normalize-space($vNamespace)}">
			<xsl:value-of select="1 * text() - 1" />
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[local-name() = 'XsdVersie']" priority="10">
		<xsl:variable name="vMessage"><xsl:value-of select="substring-before(substring-after(substring-after(substring-after(namespace-uri(), 'http://www.istandaarden.nl/'), '/'), '/'), '/')"/></xsl:variable>
		<xsl:variable name="vNumber"><xsl:value-of select="translate($vMessage, translate($vMessage, '0123456789', ''), '')" /></xsl:variable>
		<xsl:if test="$vNumber != '304'">
			<xsl:call-template name="copyElement" />
		</xsl:if>
	</xsl:template>

	<xsl:template match="*[local-name() = 'Header']" mode="postoverride" priority="10">
		<xsl:variable name="vMessage"><xsl:value-of select="substring-before(substring-after(substring-after(substring-after(namespace-uri(), 'http://www.istandaarden.nl/'), '/'), '/'), '/')"/></xsl:variable>
		<xsl:variable name="vNumber"><xsl:value-of select="translate($vMessage, translate($vMessage, '0123456789', ''), '')" /></xsl:variable>
		<xsl:if test="$vNumber = '304'">
			<xsl:variable name="vNamespace">
				<xsl:call-template name="mapNamespace">
					<xsl:with-param name="pNamespace" select="namespace-uri()" />
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="vBasisNamespace">
				<xsl:value-of select="namespace-uri(*[local-name() = 'RetourBedragen']/*[local-name() = 'IngediendTotaalBedrag'])" />
			</xsl:variable>

			<xsl:variable name="vTotaalDebet"
				select="sum(ancestor-or-self::*[local-name() = 'Bericht']//*[local-name() = 'Client']//*[local-name() = 'IngediendeBedragPrestatie']/*[local-name() = 'DeclaratieFactuurBedrag' and ./*[local-name() = 'DebetCredit']/text() = 'D']/*[local-name() = 'Bedrag'])"/>
			<xsl:variable name="vTotaalCredit"
				select="sum(ancestor-or-self::*[local-name() = 'Bericht']//*[local-name() = 'Client']//*[local-name() = 'IngediendeBedragPrestatie']/*[local-name() = 'DeclaratieFactuurBedrag' and ./*[local-name() = 'DebetCredit']/text() = 'C']/*[local-name() = 'Bedrag'])"/>
			<xsl:variable name="vSaldo" select="$vTotaalDebet - $vTotaalCredit"/>
			<xsl:element name="DeclaratieFactuurBedragen" namespace="{normalize-space($vNamespace)}">
				<xsl:choose>
					<xsl:when test="$vSaldo &lt; 0">
						<xsl:element name="DeclaratieFactuurTotaalBedrag" namespace="{normalize-space($vBasisNamespace)}">
							<xsl:element name="TotaalBedrag" namespace="{normalize-space($vBasisNamespace)}">
								<xsl:call-template name="formatNumber"><xsl:with-param name="pValue" select="0 - number($vSaldo)" /></xsl:call-template>
							</xsl:element>
							<xsl:element name="DebetCredit" namespace="{normalize-space($vBasisNamespace)}">D</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="DeclaratieFactuurTotaalBedrag" namespace="{normalize-space($vBasisNamespace)}">
							<xsl:element name="TotaalBedrag" namespace="{normalize-space($vBasisNamespace)}">
								<xsl:call-template name="formatNumber"><xsl:with-param name="pValue" select="$vSaldo" /></xsl:call-template>
							</xsl:element>
							<xsl:element name="DebetCredit" namespace="{normalize-space($vBasisNamespace)}">C</xsl:element>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<!--  need loop to change context -->
			<xsl:for-each select="*[local-name() = 'XsdVersie']">
				<xsl:call-template name="copyElement" />
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="copyElement">
		<xsl:variable name="vNamespace">
			<xsl:call-template name="mapNamespace">
				<xsl:with-param name="pNamespace" select="namespace-uri()" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:element name="{local-name()}" namespace="{normalize-space($vNamespace)}">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="*" />
			<xsl:apply-templates select="." mode="postoverride" />
			<xsl:value-of select="text()" />
		</xsl:element>
	</xsl:template>

	<xsl:template match="*">
		<xsl:call-template name="copyElement" />
	</xsl:template>

</xsl:stylesheet>
