<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_2/aw33/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_2/zk33/schema"
>
    <!-- iwlz 2.1 TR021 version 2.1.1 (2020-06-17) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR021"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR021"/>
    </xsl:template>

    <xsl:template match="aw33:Client" mode="TR021">
        <xsl:call-template name="checkzorginstelling">
            <xsl:with-param name="pThis" select=".//aw33:ToegewezenFunctie/aw33:Instelling | .//aw33:ToegewezenZorgzwaartepakket/aw33:Instelling"/>
            <xsl:with-param name="pOther" select="ancestor-or-self::aw33:Bericht/aw33:Header/aw33:Ontvanger"/>
            <xsl:with-param name="pLocal" select="true()" />
            <xsl:with-param name="pRule">TR021</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="zk33:Client" mode="TR021">
        <xsl:call-template name="checkzorginstelling">
            <xsl:with-param name="pThis" select=".//zk33:ToegewezenFunctie/zk33:Instelling | .//zk33:ToegewezenZorgzwaartepakket/zk33:Instelling"/>
            <xsl:with-param name="pOther" select="ancestor-or-self::zk33:Bericht/zk33:Header/zk33:Ontvanger"/>
            <xsl:with-param name="pLocal" select="false()" />
            <xsl:with-param name="pRule">TR021</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>