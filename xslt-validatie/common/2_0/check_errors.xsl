<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:r="http://www.istandaarden.nl/validatie/1_1/rapport/schema"
>
	<xsl:import href="basis.xsl" />
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:template match="*" mode="translateCode" priority="0">
		<xsl:param name="pCode"/>
		<xsl:variable name="vFirst" select="substring($pCode, 1, 1)" />
		<xsl:variable name="vRest" select="substring($pCode, 2)" />
		<xsl:choose>
			<xsl:when test="$vFirst = 'S' or $vFirst = 'D'">,C<xsl:value-of select="$pCode" />,</xsl:when>
			<xsl:when test="$vFirst = '9'">,TR<xsl:value-of select="$vRest" />,</xsl:when>
			<xsl:otherwise>ERROR</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="*" mode="berichtoverstijgend" priority="0">
		<xsl:param name="pCode"/>
		<xsl:choose>
			<xsl:when test="$pCode = '0001'"><xsl:value-of select="true()" /></xsl:when>
			<xsl:otherwise><xsl:value-of select="true()" /></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="*[local-name() = 'Header']/*[local-name() = 'RetourCodes']" priority="20">
		<xsl:if test="./*[local-name() = 'RetourCode' and text() = '0001']">
			<xsl:if test="ancestor-or-self::*[local-name() = 'Bericht']/*[local-name() != 'Header']">
	            <xsl:call-template name="addError">
	                <xsl:with-param name="pRule">IV028</xsl:with-param>
	                <xsl:with-param name="pElements" select=". | ancestor-or-self::*[local-name() = 'Bericht']/*[local-name() != 'Header']" />
	            </xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*[local-name() = 'RetourCode' and text() = '0001']" priority="30">
		<xsl:if test="not(ancestor::*[local-name() = 'Header'])">
            <xsl:call-template name="addError">
                <xsl:with-param name="pRule">IV028</xsl:with-param>
            </xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*[local-name() = 'RetourCode' and text() != '0200' and text() != '0233']" priority="20">
		<xsl:variable name="vRules">
			<xsl:apply-templates select="." mode="translateCode">
				<xsl:with-param name="pCode" select="normalize-space(text())" />
			</xsl:apply-templates>
		</xsl:variable>
		<xsl:variable name="vBerichtoverstijgend">
			<xsl:apply-templates select="." mode="berichtoverstijgend">
				<xsl:with-param name="pCode" select="normalize-space(text())" />
			</xsl:apply-templates>
		</xsl:variable>
		<xsl:if test="($vBerichtoverstijgend = 'false') and not(../../descendant-or-self::*[contains($vRules, concat(',', concat(@vmCode, ',')))])">
            <xsl:call-template name="addError">
                <xsl:with-param name="pRule">IV028</xsl:with-param>
            </xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template match="/" priority="20">
        <r:Rapport>
            <r:Fouten>
				<xsl:apply-templates select="*" />
            </r:Fouten>
        </r:Rapport>
	</xsl:template>

	<xsl:template match="*" priority="10">
		<xsl:apply-templates select="*" />
	</xsl:template>

</xsl:stylesheet>
