<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
>
    <!-- iWlz 2.1 CS130 version 1.8.2 (2019-08-05) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS130"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS130"/>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenZorgzwaartepakket[zk31:Leveringsvorm/text() != 2]" mode="CS130">
        <xsl:call-template name="cs130"/>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenZorgzwaartepakket[zk33:Leveringsvorm/text() != 2]" mode="CS130">
        <xsl:call-template name="cs130"/>
    </xsl:template>
    
    <xsl:template name="cs130">
    	<xsl:param name="pLeveringsvorm" select="./*[local-name() = 'Leveringsvorm']"/>
        <xsl:param name="pToewijzingPercentage" select="./*[local-name() = 'ToewijzingPercentage']"/>
        <xsl:variable name="match3digits">
	        <xsl:call-template name="testpattern">
				<xsl:with-param name="pElement" select="$pToewijzingPercentage"/>
				<xsl:with-param name="pPattern" select="'1\0\0'"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="match4digits">
	        <xsl:call-template name="testpattern">
				<xsl:with-param name="pElement" select="$pToewijzingPercentage"/>
				<xsl:with-param name="pPattern" select="'10\0\0'"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="match5digits">
	        <xsl:call-template name="testpattern">
				<xsl:with-param name="pElement" select="$pToewijzingPercentage"/>
				<xsl:with-param name="pPattern" select="'100\0\0'"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:if test="$match3digits = 'false' and $match4digits = 'false' and $match5digits = 'false'">
			<xsl:call-template name="addError">
		        <xsl:with-param name="pElements" select="$pLeveringsvorm|$pToewijzingPercentage"/>
		        <xsl:with-param name="pRule">CS130</xsl:with-param>
	        </xsl:call-template>
		</xsl:if>
    </xsl:template>
</xsl:stylesheet>
