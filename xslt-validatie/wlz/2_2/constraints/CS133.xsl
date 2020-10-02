<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_2/basisschema/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_2/zk39/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_2/aw39/schema"
>
    <!-- iWlz 2.2 CS133 version 2.1.4 (2020-07-08) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS133"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS133"/>
    </xsl:template>


    <xsl:template match="aw39:MutatieZorgzwaartepakket" mode="CS133">
        <xsl:call-template name="cs133"/>
   </xsl:template>
   
    <xsl:template match="zk39:MutatieZorgzwaartepakket" mode="CS133">
        <xsl:call-template name="cs133"/>
   </xsl:template>
   
    <xsl:template name="cs133">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsstatus']"/>
            <xsl:with-param name="pValues">!1</xsl:with-param>
            <xsl:with-param name="pRule">CS133</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
