<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
	xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
	xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema">
	<!-- iwlz 2.1 TR119 version 1.9.15 (2019-12-12) -->

	<xsl:import href="../common/basis.xsl" />
	<xsl:template match="*" mode="TR119" />
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="TR119" />
	</xsl:template>

	<xsl:template
		match="aw33:ToegewezenZorgzwaartepakket/aw33:Soort" mode="TR119">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pValue1" select="5" />
			<xsl:with-param name="pOther" select="../aw33:Opname" />
			<xsl:with-param name="pValue2" select="1" />
			<xsl:with-param name="pRule">
				TR119
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template
		match="zk33:ToegewezenZorgzwaartepakket/zk33:Soort" mode="TR119">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pValue1" select="5" />
			<xsl:with-param name="pOther" select="../zk33:Opname" />
			<xsl:with-param name="pValue2" select="1" />
			<xsl:with-param name="pRule">
				TR119
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>
