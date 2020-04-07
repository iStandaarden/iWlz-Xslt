<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:iwlz="http://www.istandaarden.nl/iwlz/1_2/basisschema/schema/1_2"
	xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
	xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
	xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
	xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema">
	<!-- iWlz 2.1 CD009 version 1.9.20 (2020-04-06) -->

	<xsl:import href="../common/basis.xsl" />
	<xsl:template match="*" mode="CD009" />
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="CD009"/>
	</xsl:template>

	<xsl:template match="aw33:Contact/aw33:Periode" mode="CD009">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pValue1">#</xsl:with-param>
			<xsl:with-param name="pOther" select="../aw33:Soort" />
			<xsl:with-param name="pValue2">04</xsl:with-param>
			<xsl:with-param name="pRule">CD009</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="zk33:Contact/zk33:Periode" mode="CD009">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pValue1">#</xsl:with-param>
			<xsl:with-param name="pOther" select="../zk33:Soort" />
			<xsl:with-param name="pValue2">04</xsl:with-param>
			<xsl:with-param name="pRule">CD009</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="zk31:Contact/zk31:Periode" mode="CD009">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pValue1">#</xsl:with-param>
			<xsl:with-param name="pOther" select="../zk31:Soort" />
			<xsl:with-param name="pValue2">04</xsl:with-param>
			<xsl:with-param name="pRule">CD009</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="io31:Contact/io31:Periode" mode="CD009">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pValue1">#</xsl:with-param>
			<xsl:with-param name="pOther" select="../io31:Soort" />
			<xsl:with-param name="pValue2">04</xsl:with-param>
			<xsl:with-param name="pRule">CD009</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>
