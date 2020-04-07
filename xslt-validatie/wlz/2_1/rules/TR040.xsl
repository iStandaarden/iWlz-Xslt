<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
>
    <!-- iwlz 2.1 TR040 version 1.9.21 (2020-04-07) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR040"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR040"/>
    </xsl:template>

    <xsl:template match="aw39:Client" mode="TR040">
    	<xsl:if test="not(aw39:MutatieFuncties/aw39:MutatieFunctie) and not(aw39:MutatieZorgzwaartepakketten/aw39:MutatieZorgzwaartepakket)">
    		<xsl:call-template name="checkvalue">
            	<xsl:with-param name="pThis" select="aw39:Aanvragen/aw39:Aanvraag"/>
            	<xsl:with-param name="pExtra" select="."/>
            	<xsl:with-param name="pValues">#</xsl:with-param>
            	<xsl:with-param name="pRule">
                	TR040
            	</xsl:with-param>
        	</xsl:call-template>
    	</xsl:if>
    </xsl:template>

    <xsl:template match="zk39:Client" mode="TR040">
        <xsl:if test="not(zk39:MutatieFuncties/zk39:MutatieFunctie) and not(zk39:MutatieZorgzwaartepakketten/zk39:MutatieZorgzwaartepakket)">
    		<xsl:call-template name="checkvalue">
            	<xsl:with-param name="pThis" select="zk39:Aanvragen/zk39:Aanvraag"/>
            	<xsl:with-param name="pExtra" select="."/>
            	<xsl:with-param name="pValues">#</xsl:with-param>
            	<xsl:with-param name="pRule">
                	TR040
            	</xsl:with-param>
        	</xsl:call-template>
    	</xsl:if>
    </xsl:template>
</xsl:stylesheet>
