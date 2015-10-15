#
# Copyright (C) 2008-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=iclient
PKG_VERSION=1.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=fuyumi <280604399@qq.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/xspin/iclient.git
PKG_SOURCE_VERSION:=210acddbce679a3d305be262fe2eb48681dfb5d1

PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/iclient
	SECTION:=net
	CATEGORY:=Network
	TITLE:=iClient1.0 for Linux
	URL:=https://github.com/xspin/iclient.git
	DEPENDS:=+libpcap +libstdcpp $(ICONV_DEPENDS)
endef

define Package/iclient/description
	iclient is a 3rd DCSM dial client.
endef

MAKE_FLAGS += \
	-C $(PKG_BUILD_DIR)/iclient-linux

define Package/iclient/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/iclient-linux/iclient $(1)/usr/bin/iclient
endef

$(eval $(call BuildPackage,iclient))
