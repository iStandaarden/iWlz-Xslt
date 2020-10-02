<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_2/basisschema/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_2/zk39/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_2/aw317/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_2/aw39/schema"
>
    <!-- iWlz 2.2 CS131 version 2.1.4 (2020-07-08) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS131"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS131"/>
    </xsl:template>


    <xsl:template match="aw39:MutatieZorgzwaartepakket" mode="CS131">
        <xsl:call-template name="cs131"/>
   </xsl:template>
   
    <xsl:template match="zk39:MutatieZorgzwaartepakket" mode="CS131">
        <xsl:call-template name="cs131"/>
   </xsl:template>
   
    <xsl:template match="zk31:ToegewezenZorgzwaartepakket" mode="CS131">
        <xsl:call-template name="cs131"/>
   </xsl:template>
   
    <xsl:template match="aw317:Leveringsstatussen/aw317:Leveringsstatus" mode="CS131">
        <xsl:call-template name="cs131"/>
   </xsl:template>
   
    <xsl:template name="cs131">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsstatus']"/>
            <xsl:with-param name="pValue1">6</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name() = 'LeveringsstatusClassificatie']" />
            <xsl:with-param name="pValue2">01,02,03,04,05,06,07,08</xsl:with-param>
            <xsl:with-param name="pRule">CS131</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsstatus']"/>
            <xsl:with-param name="pValue1">7</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name() = 'LeveringsstatusClassificatie']" />
            <xsl:with-param name="pValue2">09,10,11,12</xsl:with-param>
            <xsl:with-param name="pRule">CS131</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsstatus']"/>
            <xsl:with-param name="pValue1">2</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name() = 'LeveringsstatusClassificatie']" />
            <xsl:with-param name="pValue2">13,14,15,16,17,18,19</xsl:with-param>
            <xsl:with-param name="pRule">CS131</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsstatus']"/>
            <xsl:with-param name="pValue1">3</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name() = 'LeveringsstatusClassificatie']" />
            <xsl:with-param name="pValue2">13,14,15,17,18,19</xsl:with-param>
            <xsl:with-param name="pRule">CS131</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
