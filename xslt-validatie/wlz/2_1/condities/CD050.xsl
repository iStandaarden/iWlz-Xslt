<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
>

    <!-- iWlz 2.1 CD050 version 1.9.19 (2020-03-25) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD050"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD050"/>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenZorgzwaartepakket" mode="CD050">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="aw33:Leveringsvorm"/>
            <xsl:with-param name="pValue1">7</xsl:with-param>
            <xsl:with-param name="pOther" select="aw33:CoordinatorZorgThuis" />
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD050</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw39:Aanvraag" mode="CD050">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="aw39:Leveringsvorm"/>
            <xsl:with-param name="pValue1">7</xsl:with-param>
            <xsl:with-param name="pOther" select="aw39:CoordinatorZorgThuis" />
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD050</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenZorgzwaartepakket" mode="CD050">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="zk31:Leveringsvorm"/>
            <xsl:with-param name="pValue1">7</xsl:with-param>
            <xsl:with-param name="pOther" select="zk31:CoordinatorZorgThuis" />
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD050</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenZorgzwaartepakket" mode="CD050">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="zk33:Leveringsvorm"/>
            <xsl:with-param name="pValue1">7</xsl:with-param>
            <xsl:with-param name="pOther" select="zk33:CoordinatorZorgThuis" />
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD050</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk39:Aanvraag" mode="CD050">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="zk39:Leveringsvorm"/>
            <xsl:with-param name="pValue1">7</xsl:with-param>
            <xsl:with-param name="pOther" select="zk39:CoordinatorZorgThuis" />
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD050</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
