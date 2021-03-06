<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:aw33="http://www.istandaarden.nl/iwlz/2_2/aw33/schema"
	xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
	xmlns:zk33="http://www.istandaarden.nl/iwlz/2_2/zk33/schema"
	xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_2/basisschema/schema">
	<!-- iWlz 2.2 TR119 version 2.1.4 (2020-07-08) -->

	<xsl:import href="../common/basis.xsl" />
	<xsl:template match="*" mode="TR119" />
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="TR119" />
	</xsl:template>

	<xsl:template
		match="aw33:ToegewezenZorgzwaartepakket/aw33:Opname" mode="TR119">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pThis" select="../aw33:Soort" />
			<xsl:with-param name="pValue1" select="5" />
			<xsl:with-param name="pOther" select="." />
			<xsl:with-param name="pValue2" select="1" />
			<xsl:with-param name="pRule">
				TR119
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template
		match="zk31:ToegewezenZorgzwaartepakket/zk31:Opname" mode="TR119">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pThis" select="../zk31:Soort" />
			<xsl:with-param name="pValue1" select="5" />
			<xsl:with-param name="pOther" select="." />
			<xsl:with-param name="pValue2" select="1" />
			<xsl:with-param name="pRule">
				TR119
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template
		match="zk33:ToegewezenZorgzwaartepakket/zk33:Opname" mode="TR119">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pThis" select="../zk33:Soort" />
			<xsl:with-param name="pValue1" select="5" />
			<xsl:with-param name="pOther" select="." />
			<xsl:with-param name="pValue2" select="1" />
			<xsl:with-param name="pRule">
				TR119
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>
