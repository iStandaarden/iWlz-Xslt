<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_1/aw35/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_1/zk35/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
		    xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
		    xmlns:ca317="http://www.istandaarden.nl/iwlz/2_1/ca317/schema"
		    >

    <!-- iWlz 2.1 CS074 version 1.9.13 (2019-11-13) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS074"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS074"/>
    </xsl:template>

    <xsl:template match="aw317:GeindiceerdZorgzwaartepakket/aw317:Klasse" mode="CS074">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                KE4,KE5,KE6,KE7
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS074
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="aw33:GeindiceerdZorgzwaartepakket/aw33:Klasse" mode="CS074">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                KE4,KE5,KE6,KE7
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS074
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="aw33:ToegewezenZorgzwaartepakket/aw33:Klasse" mode="CS074">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                KE4,KE5,KE6,KE7
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS074
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="aw35:GeleverdZorgzwaartepakket/aw35:Klasse" mode="CS074">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                KE4,KE5,KE6,KE7
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS074
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="aw39:Klasse" mode="CS074">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                KE4,KE5,KE6,KE7
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS074
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="io31:GeindiceerdZorgzwaartepakket/io31:Klasse" mode="CS074">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                KE4,KE5,KE6,KE7
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS074
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk31:GeindiceerdZorgzwaartepakket/zk31:Klasse" mode="CS074">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                KE4,KE5,KE6,KE7
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS074
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk31:ToegewezenZorgzwaartepakket/zk31:Klasse" mode="CS074">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                KE4,KE5,KE6,KE7
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS074
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk33:GeindiceerdZorgzwaartepakket/zk33:Klasse" mode="CS074">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                KE4,KE5,KE6,KE7
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS074
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk33:ToegewezenZorgzwaartepakket/zk33:Klasse" mode="CS074">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                KE4,KE5,KE6,KE7
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS074
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk35:GeleverdZorgzwaartepakket/zk35:Klasse" mode="CS074">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                KE4,KE5,KE6,KE7
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS074
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk39:Klasse" mode="CS074">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                KE4,KE5,KE6,KE7
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS074
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="ca317:Klasse" mode="CS074">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                KE4,KE5,KE6,KE7
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS074
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
