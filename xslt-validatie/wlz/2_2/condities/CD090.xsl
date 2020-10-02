<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_2/aw317/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_2/aw39/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_2/zk39/schema"
>

    <!-- iWlz 2.2 CD090 version 2.1.4 (2020-07-08) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD090"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD090"/>
    </xsl:template>

    <xsl:template match="aw39:MutatieZorgzwaartepakket" mode="CD090">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="aw39:Leveringsstatus"/>
            <xsl:with-param name="pValue1">2,3,6,7</xsl:with-param>
            <xsl:with-param name="pOther" select="aw39:LeveringsstatusClassificatie" />
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD090</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk39:MutatieZorgzwaartepakket" mode="CD090">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="zk39:Leveringsstatus"/>
            <xsl:with-param name="pValue1">2,3,6,7</xsl:with-param>
            <xsl:with-param name="pOther" select="zk39:LeveringsstatusClassificatie" />
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD090</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw317:Leveringsstatus" mode="CD090">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="aw317:Leveringsstatus"/>
            <xsl:with-param name="pValue1">2,3,6,7</xsl:with-param>
            <xsl:with-param name="pOther" select="aw317:LeveringsstatusClassificatie" />
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD090</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenZorgzwaartepakket" mode="CD090">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="zk31:Leveringsstatus"/>
            <xsl:with-param name="pValue1">2,3,6,7</xsl:with-param>
            <xsl:with-param name="pOther" select="zk31:LeveringsstatusClassificatie" />
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD090</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>
