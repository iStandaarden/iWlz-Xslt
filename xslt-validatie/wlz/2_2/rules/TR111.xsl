<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
	xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_2/basisschema/schema">
	<!-- iWlz 2.2 TR111 version 2.1.4 (2020-07-08) -->

	<xsl:import href="../common/basis.xsl" />
	<xsl:template match="*" mode="TR111" />
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="TR111" />
	</xsl:template>

	<xsl:template match="zk31:ToegewezenZorgzwaartepakket/zk31:Einddatum"
		mode="TR111">
		<xsl:call-template name="checkafter">
			<xsl:with-param name="pOther"
				select="ancestor-or-self::zk31:Indicatie/zk31:Overdrachtdatum" />
			<xsl:with-param name="pRule">
				TR111
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="zk31:ToegewezenFunctie/zk31:Einddatum"
		mode="TR111">
		<xsl:call-template name="checkafter">
			<xsl:with-param name="pOther"
				select="ancestor-or-self::zk31:Indicatie/zk31:Overdrachtdatum" />
			<xsl:with-param name="pRule">
				TR111
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>
