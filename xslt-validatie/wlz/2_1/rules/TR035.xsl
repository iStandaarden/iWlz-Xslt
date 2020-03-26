<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
>
    <!-- iwlz 2.1 TR035 version 1.9.19 (2020-03-25) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR035"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR035"/>
    </xsl:template>

    <xsl:template match="aw33:GeindiceerdeFunctie" mode="TR035">
        <xsl:call-template name="tr035"/>
    </xsl:template>

    <xsl:template match="aw33:GeindiceerdZorgzwaartepakket" mode="TR035">
        <xsl:call-template name="tr035"/>
    </xsl:template>

    <xsl:template match="io31:GeindiceerdeFunctie" mode="TR035">
        <xsl:call-template name="tr035"/>
    </xsl:template>

    <xsl:template match="io31:GeindiceerdZorgzwaartepakket" mode="TR035">
        <xsl:call-template name="tr035"/>
    </xsl:template>

    <xsl:template match="zk31:GeindiceerdeFunctie" mode="TR035">
        <xsl:call-template name="tr035"/>
    </xsl:template>

    <xsl:template match="zk31:GeindiceerdZorgzwaartepakket" mode="TR035">
        <xsl:call-template name="tr035"/>
    </xsl:template>

    <xsl:template match="zk33:GeindiceerdeFunctie" mode="TR035">
        <xsl:call-template name="tr035"/>
    </xsl:template>

    <xsl:template match="zk33:GeindiceerdZorgzwaartepakket" mode="TR035">
        <xsl:call-template name="tr035"/>
    </xsl:template>

    <xsl:template name="tr035">
        <xsl:param name="pZorgeenheid" select="."/>
        <xsl:param name="pList" select="preceding-sibling::*"/>

        <xsl:for-each select="$pList">
            <xsl:if test="$pZorgeenheid/*[local-name() = 'FunctieCode' or local-name() = 'ZzpCode'] = current()/*[local-name() = 'FunctieCode' or local-name() = 'ZzpCode']">

                <xsl:variable name="isOverlay">
                    <xsl:call-template name="isPeriodOverlay">
                        <xsl:with-param name="pThis" select="$pZorgeenheid"/>
                        <xsl:with-param name="pOther" select="current()"/>
                    </xsl:call-template>
                </xsl:variable>

                <xsl:if test="$isOverlay = 'true'">
                    <xsl:call-template name="addError">
                        <xsl:with-param name="pElements" select="$pZorgeenheid | current()"/>
                        <xsl:with-param name="pRule">TR035</xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

            </xsl:if>
        </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>
