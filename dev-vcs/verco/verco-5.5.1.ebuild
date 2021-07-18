# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.2

EAPI=7

CRATES="
	arc-swap-0.4.7
	arrayref-0.3.6
	arrayvec-0.5.1
	autocfg-1.0.1
	base64-0.12.3
	bitflags-1.2.1
	blake2b_simd-0.5.10
	cc-1.0.59
	cfg-if-0.1.10
	cloudabi-0.0.3
	constant_time_eq-0.1.5
	crossbeam-utils-0.7.2
	crossterm-0.17.7
	crossterm_winapi-0.6.1
	ctrlc-3.1.6
	dirs-next-1.0.1
	dirs-sys-next-0.1.0
	getrandom-0.1.14
	lazy_static-1.4.0
	libc-0.2.76
	lock_api-0.3.4
	log-0.4.11
	memchr-2.3.3
	mio-0.7.0
	miow-0.3.5
	nix-0.17.0
	ntapi-0.3.4
	parking_lot-0.10.2
	parking_lot_core-0.7.2
	redox_syscall-0.1.57
	redox_users-0.3.5
	rust-argon2-0.8.2
	rustyline-6.2.0
	scopeguard-1.1.0
	signal-hook-0.1.16
	signal-hook-registry-1.2.1
	smallvec-1.4.2
	socket2-0.3.12
	unicode-segmentation-1.6.0
	unicode-width-0.1.8
	utf8parse-0.2.0
	void-1.0.2
	wasi-0.9.0+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="A simple Git/Hg version control client based on keyboard shortcuts"
HOMEPAGE="https://github.com/matheuslessarodrigues/verco"
SRC_URI="
  https://github.com/vamolessa/${PN}/archive/refs/tags/v${PV}.tar.gz
  $(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 BSD-2-Clause CC0-1.0 MIT"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror"
