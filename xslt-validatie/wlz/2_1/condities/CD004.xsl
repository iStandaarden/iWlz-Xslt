<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:aw35="http://www.istandaarden.nl/iwlz/2_1/aw35/schema"
	xmlns:zk35="http://www.istandaarden.nl/iwlz/2_1/zk35/schema">
	<!-- iWlz 2.1 CD004 version 1.8.5 (2019-08-28) -->

	<xsl:import href="../common/basis.xsl" />
	<xsl:template match="*" mode="CD004" />
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="CD004"/>
	</xsl:template>

	<xsl:template match="aw35:GeleverdZorgzwaartepakket/aw35:Sleuteldatum" mode="CD004">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pValue1">#</xsl:with-param>
			<xsl:with-param name="pOther" select="../aw35:Leveringsvorm" />
			<xsl:with-param name="pValue2">4</xsl:with-param>
			<xsl:with-param name="pRule">CD004</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="zk35:GeleverdZorgzwaartepakket/zk35:Sleuteldatum" mode="CD004">
		<xsl:call-template name="checkimplication">
			<xsl:with-param name="pValue1">#</xsl:with-param>
			<xsl:with-param name="pOther" select="../zk35:Leveringsvorm" />
			<xsl:with-param name="pValue2">4</xsl:with-param>
			<xsl:with-param name="pRule">CD004</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>
