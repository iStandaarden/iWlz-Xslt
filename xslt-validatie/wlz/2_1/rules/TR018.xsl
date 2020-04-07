<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
>
    <!-- iwlz 2.1 TR018 version 1.9.20 (2020-04-06) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR018"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR018"/>
    </xsl:template>

    <xsl:template match="aw39:MutatieFunctie" mode="TR018">
        <xsl:if test="aw39:Begindatum and aw39:Begindatum != ''">
            <xsl:call-template name="checkafter">
                <xsl:with-param name="pThis" select="aw39:Mutatiedatum"/>
                <xsl:with-param name="pOther" select="aw39:Begindatum"/>
                <xsl:with-param name="pRule">TR018</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template match="aw39:MutatieZorgzwaartepakket" mode="TR018">
        <xsl:if test="aw39:Begindatum and aw39:Begindatum != ''">
            <xsl:call-template name="checkafter">
                <xsl:with-param name="pThis" select="aw39:Mutatiedatum"/>
                <xsl:with-param name="pOther" select="aw39:Begindatum"/>
                <xsl:with-param name="pRule">TR018</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template match="zk39:MutatieFunctie" mode="TR018">
        <xsl:if test="zk39:Begindatum and zk39:Begindatum != ''">
            <xsl:call-template name="checkafter">
                <xsl:with-param name="pThis" select="zk39:Mutatiedatum"/>
                <xsl:with-param name="pOther" select="zk39:Begindatum"/>
                <xsl:with-param name="pRule">TR018</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template match="zk39:MutatieZorgzwaartepakket" mode="TR018">
        <xsl:if test="zk39:Begindatum and zk39:Begindatum != ''">
            <xsl:call-template name="checkafter">
                <xsl:with-param name="pThis" select="zk39:Mutatiedatum"/>
                <xsl:with-param name="pOther" select="zk39:Begindatum"/>
                <xsl:with-param name="pRule">TR018</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
