<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
	xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_2/basisschema/schema">
	<!-- iWlz 2.2 TR108 version 2.1.4 (2020-07-08) -->

	<xsl:import href="../common/basis.xsl" />
	<xsl:template match="*" mode="TR108" />
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="TR108" />
	</xsl:template>

	<xsl:template
		match="zk31:ToegewezenZorgzwaartepakket/zk31:Leveringsvorm[text() = '2']"
		mode="TR108">
		<xsl:choose>
			<xsl:when
				test="substring-before(substring-after(ancestor-or-self::zk31:Bericht/zk31:Header/zk31:BerichtIdentificatie/iwlz:Dagtekening, '-'), '-') != '11' and substring-before(substring-after(ancestor-or-self::zk31:Bericht/zk31:Header/zk31:BerichtIdentificatie/iwlz:Dagtekening, '-'), '-') != '12'">
				<xsl:call-template name="addError">
					<xsl:with-param name="pElements"
						select=". | ancestor-or-self::zk31:Bericht/zk31:Header/zk31:BerichtIdentificatie/iwlz:Dagtekening" />
					<xsl:with-param name="pRule">
						TR108
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
