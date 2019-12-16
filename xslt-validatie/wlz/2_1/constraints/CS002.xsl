<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
	xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
	xmlns:aw35="http://www.istandaarden.nl/iwlz/2_1/aw35/schema"
	xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
	xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema"
	xmlns:ca317="http://www.istandaarden.nl/iwlz/2_1/ca317/schema"
	xmlns:ca319="http://www.istandaarden.nl/iwlz/2_1/ca319/schema"
	xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
	xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
	xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
	xmlns:zk35="http://www.istandaarden.nl/iwlz/2_1/zk35/schema"
	xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
	>
	<!-- iwlz 2.1 CS002 version 1.9.11 (2019-10-11) -->
	
	<xsl:import href="../common/basis.xsl"/>
	<xsl:template match="*" mode="CS002" />
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="CS002"/>
	</xsl:template>

	<xsl:template match="aw33:Bsn" mode="CS002">
		<xsl:call-template name="check11proef">
			<xsl:with-param name="pRule">CS002</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="aw35:Bsn" mode="CS002">
		<xsl:call-template name="check11proef">
			<xsl:with-param name="pRule">CS002</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="aw39:Bsn" mode="CS002">
		<xsl:call-template name="check11proef">
			<xsl:with-param name="pRule">CS002</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="aw317:Bsn" mode="CS002">
		<xsl:call-template name="check11proef">
			<xsl:with-param name="pRule">CS002</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="ca317:Bsn" mode="CS002">
		<xsl:call-template name="check11proef">
			<xsl:with-param name="pRule">CS002</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="ca319:Bsn" mode="CS002">
		<xsl:call-template name="check11proef">
			<xsl:with-param name="pRule">CS002</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="io31:Bsn" mode="CS002">
		<xsl:call-template name="check11proef">
			<xsl:with-param name="pRule">CS002</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="zk31:Bsn" mode="CS002">
		<xsl:call-template name="check11proef">
			<xsl:with-param name="pRule">CS002</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="zk33:Bsn" mode="CS002">
		<xsl:call-template name="check11proef">
			<xsl:with-param name="pRule">CS002</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="zk35:Bsn" mode="CS002">
		<xsl:call-template name="check11proef">
			<xsl:with-param name="pRule">CS002</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="zk39:Bsn" mode="CS002">
		<xsl:call-template name="check11proef">
			<xsl:with-param name="pRule">CS002</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>
