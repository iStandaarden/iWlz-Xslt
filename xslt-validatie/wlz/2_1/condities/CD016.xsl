<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
	xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
	xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
	xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
	xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema">
	<!-- iWlz 2.1 CD016 version 1.9.21 (2020-04-07) -->

	<xsl:import href="../common/basis.xsl" />
	<xsl:template match="*" mode="CD016" />
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="CD016"/>
	</xsl:template>

	<xsl:template match="aw33:Relatie" mode="CD016">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pThis" select="aw33:Soort" />
			<xsl:with-param name="pValue1">!12</xsl:with-param>
			<xsl:with-param name="pOther" select="aw33:Volgorde" />
			<xsl:with-param name="pValue2">#</xsl:with-param>
			<xsl:with-param name="pRule">CD016</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="io31:Relatie" mode="CD016">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pThis" select="io31:Soort" />
			<xsl:with-param name="pValue1">!12</xsl:with-param>
			<xsl:with-param name="pOther" select="io31:Volgorde" />
			<xsl:with-param name="pValue2">#</xsl:with-param>
			<xsl:with-param name="pRule">CD016</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="zk31:Relatie" mode="CD016">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pThis" select="zk31:Soort" />
			<xsl:with-param name="pValue1">!12</xsl:with-param>
			<xsl:with-param name="pOther" select="zk31:Volgorde" />
			<xsl:with-param name="pValue2">#</xsl:with-param>
			<xsl:with-param name="pRule">CD016</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="zk33:Relatie" mode="CD016">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pThis" select="zk33:Soort" />
			<xsl:with-param name="pValue1">!12</xsl:with-param>
			<xsl:with-param name="pOther" select="zk33:Volgorde" />
			<xsl:with-param name="pValue2">#</xsl:with-param>
			<xsl:with-param name="pRule">CD016</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>
