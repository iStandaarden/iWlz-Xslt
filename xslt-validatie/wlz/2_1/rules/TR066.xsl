<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
>
    <!-- iwlz 2.1 TR066 version 1.9.21 (2020-04-07) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR066"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR066"/>
    </xsl:template>

    <xsl:template match="aw39:MutatieFunctie" mode="TR066">
        <xsl:call-template name="tr066"/>
    </xsl:template>

    <xsl:template match="aw39:MutatieZorgzwaartepakket" mode="TR066">
        <xsl:call-template name="tr066"/>
    </xsl:template>

    <xsl:template match="zk39:MutatieZorgzwaartepakket" mode="TR066">
        <xsl:call-template name="tr066"/>
    </xsl:template>

    <xsl:template match="zk39:MutatieFunctie" mode="TR066">
        <xsl:call-template name="tr066"/>
    </xsl:template>

    <xsl:template name="tr066">
        <xsl:param name="pMutatieCode" select="./*[local-name() = 'Mutatiecode']"/>
        <xsl:param name="pBeginDatum" select="./*[local-name() = 'Begindatum']"/>

        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="$pMutatieCode"/>
            <xsl:with-param name="pValue1">17,19,20</xsl:with-param>
            <xsl:with-param name="pOther" select="$pBeginDatum"/>
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">
                TR066
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="$pMutatieCode"/>
            <xsl:with-param name="pValue1">12,18,21</xsl:with-param>
            <xsl:with-param name="pOther" select="$pBeginDatum"/>
            <xsl:with-param name="pValue2"></xsl:with-param>
            <xsl:with-param name="pRule">
                TR066
            </xsl:with-param>
        </xsl:call-template>

    </xsl:template>

</xsl:stylesheet>
