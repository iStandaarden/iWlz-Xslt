<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_2/basisschema/schema"
	xmlns:aw33="http://www.istandaarden.nl/iwlz/2_2/aw33/schema"
	xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
	xmlns:zk33="http://www.istandaarden.nl/iwlz/2_2/zk33/schema"
	xmlns:io31="http://www.istandaarden.nl/iwlz/2_2/io31/schema">
	<!-- iWlz 2.2 CD034 version 2.1.4 (2020-07-08) -->

	<xsl:import href="../common/basis.xsl" />
	<xsl:template match="*" mode="CD034" />
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="CD034"/>
	</xsl:template>

	<xsl:template match="aw33:Adres" mode="CD034">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pThis" select="../aw33:Soort" />
			<xsl:with-param name="pValue1">01,03</xsl:with-param>
			<xsl:with-param name="pOther" select="iwlz:Postcode" />
			<xsl:with-param name="pValue2">*</xsl:with-param>
			<xsl:with-param name="pRule">CD034</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="zk33:Adres" mode="CD034">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pThis" select="../zk33:Soort" />
			<xsl:with-param name="pValue1">01,03</xsl:with-param>
			<xsl:with-param name="pOther" select="iwlz:Postcode" />
			<xsl:with-param name="pValue2">*</xsl:with-param>
			<xsl:with-param name="pRule">CD034</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="zk31:Adres" mode="CD034">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pThis" select="../zk31:Soort" />
			<xsl:with-param name="pValue1">01,03</xsl:with-param>
			<xsl:with-param name="pOther" select="iwlz:Postcode" />
			<xsl:with-param name="pValue2">*</xsl:with-param>
			<xsl:with-param name="pRule">CD034</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="io31:Adres" mode="CD034">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pThis" select="../io31:Soort" />
			<xsl:with-param name="pValue1">01,03</xsl:with-param>
			<xsl:with-param name="pOther" select="iwlz:Postcode" />
			<xsl:with-param name="pValue2">*</xsl:with-param>
			<xsl:with-param name="pRule">CD034</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>
