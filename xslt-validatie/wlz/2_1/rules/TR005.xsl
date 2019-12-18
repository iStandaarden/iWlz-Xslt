<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
				xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
				xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
				xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
				xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
>
	<!-- iwlz 2.1 TR005 version 1.9.14 (2019-12-02) -->

	<xsl:import href="../common/basis.xsl"/>
	<xsl:template match="*" mode="TR005"/>
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="TR005"/>
	</xsl:template>

	<xsl:template match="aw33:Client" mode="TR005">
		<xsl:call-template name="checkTR005">
			<xsl:with-param name="pAfgifteDatum" select="aw33:Indicatie/aw33:Afgiftedatum"/>
			<xsl:with-param name="pList" select="aw33:Relaties/aw33:Relatie"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="zk33:Client" mode="TR005">
		<xsl:call-template name="checkTR005">
			<xsl:with-param name="pAfgifteDatum" select="zk33:Indicatie/zk33:Afgiftedatum"/>
			<xsl:with-param name="pList" select="zk33:Relaties/zk33:Relatie"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="zk31:Client" mode="TR005">
		<xsl:call-template name="checkTR005">
			<xsl:with-param name="pAfgifteDatum" select="zk31:Indicatie/zk31:Afgiftedatum"/>
			<xsl:with-param name="pList" select="zk31:Relaties/zk31:Relatie"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="io31:Client" mode="TR005">
		<xsl:call-template name="checkTR005">
			<xsl:with-param name="pAfgifteDatum" select="io31:Indicatie/io31:Afgiftedatum"/>
			<xsl:with-param name="pList" select="io31:Relaties/io31:Relatie"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="checkTR005">
		<xsl:param name="pAfgifteDatum"/>
		<xsl:param name="pList"/>

		<xsl:if test="translate($pAfgifteDatum, '-', '') > translate('2007-03-01', '-', '')">
			<xsl:for-each select="$pList">
				<xsl:variable name="soort" select="current()/*[local-name() = 'Soort']"/>
				<xsl:variable name="huisnummer"
							  select="current()/*[local-name() = 'Contact']/*[local-name() = 'Adres']/iwlz:Huis/iwlz:Huisnummer"/>
				<xsl:variable name="postcode"
							  select="current()/*[local-name() = 'Contact']/*[local-name() = 'Adres']/iwlz:Postcode"/>

				<xsl:if test="$soort = 12 and (normalize-space($huisnummer) = '' or normalize-space($postcode) = '')">
					<xsl:call-template name="addError">
						<xsl:with-param name="pElements" select="$pAfgifteDatum | $soort | $huisnummer | $postcode"/>
						<xsl:with-param name="pRule">
							TR005
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>


</xsl:stylesheet>
