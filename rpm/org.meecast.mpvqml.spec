%define __requires_exclude ^.*Qt_5_PRIVATE_API.*$
Name:       org.meecast.mpvqml
Summary:    Mpv with Qml
Version:    0.2
Release:    1
License:    GPL-2.0
URL:        https://meecast.org
Source0:    %{name}-%{version}.tar.bz2

Requires:   sailfishsilica-qt5 >= 0.10.9
BuildRequires:  pkgconfig(auroraapp)
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Quick)

%description
Qml frontend for mpv for AuroraOS

%prep
%autosetup

%build
%qmake5
sed -i "s/ -pie//" Makefile
%make_build

%install
%make_install


%files
%defattr(-,root,root,-)
%{_bindir}/%{name}
%defattr(644,root,root,-)
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png

%changelog
* Tue Apr 29 2025 Vlad Vasilyeu <vasvlad@gmail.com> - 0.2-1
- Fixed select video file error in Aurora4 in landscape mode
- Fixed prevent blancking screen
- Added About page
* Tue Apr 29 2025 Vlad Vasilyeu <vasvlad@gmail.com> - 0.2-1
- Added main view
- Added save position setting
- Added buttons forward and back 10 seconds
- Added URL source for play video


