<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:aw39="http://www.istandaarden.nl/iwlz/2_2/aw39/schema"
	xmlns:zk39="http://www.istandaarden.nl/iwlz/2_2/zk39/schema"
	xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_2/basisschema/schema">
	<!-- iWlz 2.2 TR120 version 2.1.4 (2020-07-08) -->

	<xsl:import href="../common/basis.xsl" />
	<xsl:template match="*" mode="TR120" />
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="TR120" />
	</xsl:template>

	<xsl:template
		match="aw39:Aanvraag[aw39:Leveringsvorm/text() = '4']/aw39:AanvraagInstellingen/aw39:AanvraagInstelling[aw39:Opname/text() = '1']"
		mode="TR120">
		<xsl:variable name="vDate" select="aw39:ToewijzingIngangsdatum/text()" />
		<xsl:variable name="vSort" select="aw39:Soort/text()" />
		<xsl:variable name="vThis" select="." />
		
		<xsl:for-each select="following-sibling::aw39:AanvraagInstelling[aw39:Opname/text() = '1' and aw39:Soort/text() = $vSort and aw39:ToewijzingIngangsdatum/text() = $vDate]">
			<xsl:call-template name="addError">
				<xsl:with-param name="pRule">
					TR120
				</xsl:with-param>
				<xsl:with-param name="pElements"
					select="$vThis/../../aw39:Leveringsvorm | $vThis/aw39:Opname | $vThis/aw39:ToewijzingIngangsdatum | $vThis/aw39:Soort | ./aw39:Opname | ./aw39:ToewijzingIngangsdatum | ./aw39:Soort" />
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template
		match="zk39:Aanvraag[zk39:Leveringsvorm/text() = '4']/zk39:AanvraagInstellingen/zk39:AanvraagInstelling[zk39:Opname/text() = '1']"
		mode="TR120">
		<xsl:variable name="vDate" select="zk39:ToewijzingIngangsdatum/text()" />
		<xsl:variable name="vSort" select="zk39:Soort/text()" />
		<xsl:variable name="vThis" select="." />
		
		<xsl:for-each select="following-sibling::zk39:AanvraagInstelling[zk39:Opname/text() = '1' and zk39:Soort/text() = $vSort and zk39:ToewijzingIngangsdatum/text() = $vDate]">
			<xsl:call-template name="addError">
				<xsl:with-param name="pRule">
					TR120
				</xsl:with-param>
				<xsl:with-param name="pElements"
					select="$vThis/../../zk39:Leveringsvorm | $vThis/zk39:Opname | $vThis/zk39:ToewijzingIngangsdatum | $vThis/zk39:Soort | ./zk39:Opname | ./zk39:ToewijzingIngangsdatum | ./zk39:Soort" />
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet>