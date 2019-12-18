<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
>
    <!-- iwlz 2.1 TR041 version 1.9.14 (2019-12-02) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR041"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR041"/>
    </xsl:template>

    <xsl:template match="aw39:MutatieZorgzwaartepakket/aw39:Mutatiecode[ancestor-or-self::aw39:Client/aw39:Aanvragen/aw39:Aanvraag]" mode="TR041">
    		<xsl:call-template name="checkvalue">
            	<xsl:with-param name="pExtra" select="ancestor-or-self::aw39:Client/aw39:Aanvragen/aw39:Aanvraag"/>
            	<xsl:with-param name="pValues">12,18,19</xsl:with-param>
            	<xsl:with-param name="pRule">
                	TR041
            	</xsl:with-param>
        	</xsl:call-template>
    </xsl:template>
    
    <xsl:template match="zk39:MutatieZorgzwaartepakket/zk39:Mutatiecode[ancestor-or-self::zk39:Client/zk39:Aanvragen/zk39:Aanvraag]" mode="TR041">
    		<xsl:call-template name="checkvalue">
            	<xsl:with-param name="pExtra" select="ancestor-or-self::zk39:Client/zk39:Aanvragen/zk39:Aanvraag"/>
            	<xsl:with-param name="pValues">12,18,19</xsl:with-param>
            	<xsl:with-param name="pRule">
                	TR041
            	</xsl:with-param>
        	</xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
