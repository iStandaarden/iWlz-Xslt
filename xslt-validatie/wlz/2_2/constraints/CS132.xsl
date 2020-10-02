<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_2/basisschema/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_2/zk33/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_2/aw317/schema"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_2/aw33/schema"
>
    <!-- iWlz 2.2 CS132 version 2.1.4 (2020-07-08) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS132"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS132"/>
    </xsl:template>


    <xsl:template match="zk31:ToegewezenZorgzwaartepakket" mode="CS132">
        <xsl:call-template name="cs132"/>
   </xsl:template>
   
    <xsl:template match="aw33:ToegewezenZorgzwaartepakket" mode="CS132">
        <xsl:call-template name="cs132"/>
   </xsl:template>
   
    <xsl:template match="zk33:ToegewezenZorgzwaartepakket" mode="CS132">
        <xsl:call-template name="cs132"/>
   </xsl:template>
   
    <xsl:template match="aw317:WachtlijstZorgzwaartepakket" mode="CS132">
        <xsl:call-template name="cs132"/>
   </xsl:template>
   
    <xsl:template name="cs132">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsvorm']"/>
            <xsl:with-param name="pValues">!9</xsl:with-param>
            <xsl:with-param name="pRule">CS132</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
