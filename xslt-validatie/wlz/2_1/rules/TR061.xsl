<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
>
    <!-- iwlz 2.1 TR061 version 1.9.21 (2020-04-07) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR061"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR061"/>
    </xsl:template>

    <xsl:template match="aw33:Client/aw33:Contactgegevens" mode="TR061">
        <xsl:if test="not(./aw33:Contact/aw33:Soort[text() = '01' or text() = '03'])">
            <xsl:call-template name="addError">
                <xsl:with-param name="pElements" select="aw33:Contact"/>
                <xsl:with-param name="pRule">
                    TR061
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template match="io31:Client/io31:Contactgegevens" mode="TR061">
        <xsl:if test="not(./io31:Contact/io31:Soort[text() = '01' or text() = '03'])">
            <xsl:call-template name="addError">
                <xsl:with-param name="pElements" select="io31:Contact"/>
                <xsl:with-param name="pRule">
                    TR061
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template match="zk33:Client/zk33:Contactgegevens" mode="TR061">
        <xsl:if test="not(./zk33:Contact/zk33:Soort[text() = '01' or text() = '03'])">
            <xsl:call-template name="addError">
                <xsl:with-param name="pElements" select="zk33:Contact"/>
                <xsl:with-param name="pRule">
                    TR061
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
