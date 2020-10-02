<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_2/aw35/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_2/zk35/schema">

    <!-- iWlz 2.2 CS062 version 2.1.4 (2020-07-08) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS062"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS062"/>
    </xsl:template>

    <xsl:template match="aw35:GeleverdZorgzwaartepakket/aw35:Leveringsstatus" mode="CS062">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">4</xsl:with-param>
            <xsl:with-param name="pRule">CS062</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk35:GeleverdZorgzwaartepakket/zk35:Leveringsstatus" mode="CS062">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">4</xsl:with-param>
            <xsl:with-param name="pRule">CS062</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
