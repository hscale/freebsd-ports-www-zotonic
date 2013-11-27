# $FreeBSD$

PORTNAME=	zotonic
PORTVERSION=	0.9.4
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}

MAINTAINER=	marc.vanwoerkom@gmail.com
COMMENT=	Erlang Web Framework and Content Management System

LICENSE=	AL2

BUILD_DEPENDS=	erlc:${PORTSDIR}/lang/erlang
RUN_DEPENDS=	erl:${PORTSDIR}/lang/erlang
# TODO
# require erlang >= R14B03
# require imagemagick >= 6.5
# require postgresql >= 8.4

USES=		gmake iconv
USE_ZIP=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}

APPDIR_REL=	lib/erlang/lib/${PORTNAME}-${PORTVERSION}
APPDIR=		${PREFIX}/${APPDIR_REL}

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}-${PORTVERSION}

.include <bsd.port.pre.mk>
post-extract:
	@${FIND} ${WRKSRC} -name .empty -delete

post-patch:
	@${FIND} ${WRKSRC} -name \*.orig -delete
# FreeBSD 10 introduced native iconv support
.if empty(ICONV_LIB)
	@${REINPLACE_CMD} -e 's/freebsd/freebsdSKIP/' ${WRKSRC}/deps/eiconv/rebar.config
.endif

do-build:
	@cd ${BUILD_WRKSRC}; \
		${GMAKE}

do-install:
	@${LN} -sf ../${APPDIR_REL}/bin/zotonic ${STAGEDIR}${PREFIX}/bin/zotonic
	@${MKDIR} ${STAGEDIR}${APPDIR}/bin
	@${MKDIR} ${STAGEDIR}${APPDIR}/deps
	@${MKDIR} ${STAGEDIR}${APPDIR}/doc
	@${MKDIR} ${STAGEDIR}${APPDIR}/ebin
	@${MKDIR} ${STAGEDIR}${APPDIR}/include
	@${MKDIR} ${STAGEDIR}${APPDIR}/priv
	@${MKDIR} ${STAGEDIR}${APPDIR}/src
	@${MKDIR} ${STAGEDIR}${APPDIR}/src/scripts
	@${MKDIR} ${STAGEDIR}${APPDIR}/src/scripts/helpers
.for FILE in \
		AUTHORS CONTRIBUTORS Emakefile GNUmakefile LICENSE \
		Makefile NEWS README.md TRANSLATORS
	@${INSTALL_DATA} ${WRKSRC}/${FILE} ${STAGEDIR}${APPDIR}
.endfor
	@${INSTALL_SCRIPT} ${WRKSRC}/start.sh ${STAGEDIR}${APPDIR}
	@${INSTALL_SCRIPT} ${WRKSRC}/bin/zotonic ${STAGEDIR}${APPDIR}/bin
	@${INSTALL_DATA} ${WRKSRC}/ebin/* ${STAGEDIR}${APPDIR}/ebin
	@${INSTALL_DATA} ${WRKSRC}/include/* ${STAGEDIR}${APPDIR}/include
.for FILE in \
		zotonic-addsite zotonic-compilefile zotonic-copysite \
		zotonic-createdb zotonic-createschema zotonic-debug \
		zotonic-disablesite zotonic-dropschema zotonic-enablesite \
		zotonic-etop zotonic-examplecommand zotonic-generate-edoc \
		zotonic-installmodule zotonic-restart zotonic-runtests \
		zotonic-shell zotonic-sitedir zotonic-snapshot zotonic-start \
		zotonic-status zotonic-stop zotonic-update
	@${INSTALL_SCRIPT} ${WRKSRC}/src/scripts/${FILE} ${STAGEDIR}${APPDIR}/src/scripts
.endfor
.for FILE in \
		zotonic-createdb_sql.in zotonic-createschema_sql.in \
		zotonic-dropschema_sql.in zotonic_completion \
		zotonic_enabledisable
	@${INSTALL_DATA} ${WRKSRC}/src/scripts/helpers/${FILE} ${STAGEDIR}${APPDIR}/src/scripts/helpers
.endfor
.for FILE in \
		zotonic_setup zotonic_teardown
	@${INSTALL_SCRIPT} ${WRKSRC}/src/scripts/helpers/${FILE} ${STAGEDIR}${APPDIR}/src/scripts/helpers
.endfor
#TODO install remaining ${WRKSRC}/src files

post-install:
	@${MKDIR} ${STAGEDIR}${DEPS}
	@(cd ${WRKSRC}/deps && ${COPYTREE_SHARE} . ${STAGEDIR}${APPDIR}/deps)
# TODO rebar scripts lack execute permissions
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	@(cd ${WRKSRC}/doc && ${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR})
	@${MKDIR} ${STAGEDIR}${DEPS}
	@(cd ${WRKSRC}/modules && ${COPYTREE_SHARE} . ${STAGEDIR}${APPDIR}/modules)

# TODO
# assist with enabling trust-authentication in postgresql
# see http://zotonic.com/docs/0.9/tutorials/preinstall.html

# TODO handle warnings from "make stage" QA

.include <bsd.port.post.mk>
