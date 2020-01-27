<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema"
    >

    <!-- iWlz 2.1 CD040 version 1.9.18 (2020-01-24) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD040"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD040"/>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenZorgzwaartepakket" mode="CD040">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="aw33:Leveringsvorm "/>
            <xsl:with-param name="pValue1">2</xsl:with-param>
            <xsl:with-param name="pOther" select="aw33:ToewijzingPercentage"/>
            <xsl:with-param name="pValue2">!#</xsl:with-param>
            <xsl:with-param name="pRule">CD040</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="aw33:Leveringsvorm "/>
            <xsl:with-param name="pValue1">2</xsl:with-param>
            <xsl:with-param name="pOther" select="aw33:Instelling"/>
            <xsl:with-param name="pValue2">!#</xsl:with-param>
            <xsl:with-param name="pRule">CD040</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw39:AanvraagInstelling" mode="CD040">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="../../aw39:Leveringsvorm "/>
            <xsl:with-param name="pValue1">2</xsl:with-param>
            <xsl:with-param name="pOther" select="aw39:ToewijzingPercentage"/>
            <xsl:with-param name="pValue2">!#</xsl:with-param>
            <xsl:with-param name="pRule">CD040</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw317:WachtlijstZorgzwaartepakket" mode="CD040">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="aw317:Leveringsvorm "/>
            <xsl:with-param name="pValue1">2</xsl:with-param>
            <xsl:with-param name="pOther" select="aw317:Instelling"/>
            <xsl:with-param name="pValue2">!#</xsl:with-param>
            <xsl:with-param name="pRule">CD040</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenZorgzwaartepakket" mode="CD040">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="zk31:Leveringsvorm "/>
            <xsl:with-param name="pValue1">2</xsl:with-param>
            <xsl:with-param name="pOther" select="zk31:Instelling"/>
            <xsl:with-param name="pValue2">!#</xsl:with-param>
            <xsl:with-param name="pRule">CD040</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenZorgzwaartepakket" mode="CD040">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="zk33:Leveringsvorm "/>
            <xsl:with-param name="pValue1">2</xsl:with-param>
            <xsl:with-param name="pOther" select="zk33:Instelling"/>
            <xsl:with-param name="pValue2">!#</xsl:with-param>
            <xsl:with-param name="pRule">CD040</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk39:AanvraagInstelling" mode="CD040">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="../../zk39:Leveringsvorm "/>
            <xsl:with-param name="pValue1">2</xsl:with-param>
            <xsl:with-param name="pOther" select="zk39:ToewijzingPercentage"/>
            <xsl:with-param name="pValue2">!#</xsl:with-param>
            <xsl:with-param name="pRule">CD040</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
