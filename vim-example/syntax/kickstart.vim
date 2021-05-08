" Vim syntax file
" Language: RedHat kickstart installation description files

if exists("b:current_syntax")
  finish
end

" Comments {{{
syn match   kickstartComment '\v^\s*#.*$' contains=kickstartTodo
syn keyword kickstartTodo TODO FIXME NOT XXX contained
syn region  kickstartString start='\v"' end='\v"' 
"}}}

" Base constructs and sectioning {{{
syn match  kickstartInclude '\v^\s*\%(include|ksappend)>'

syn region kickstartPackages matchgroup=kickstartInclude start='\v\%packages>' end='\v\%end>' contains=kickstartPackageGroup,kickstartComment,kickstartPackageOption,kickstartPackageRemove
syn match  kickstartPackageGroup '\v^\@.*' contained contains=kickstartPackageGroupOption
syn match  kickstartPackageRemove '\v^\-.*' contained
syn match  kickstartPackageOption '\v--(resolvedeps|ignoredeps)>' contained
syn match  kickstartPackageOption '\v--(ignoremissing|nocore|excludedocs|multilib)>' contained
syn match  kickstartPackageGroupOption '\v--(nodefaults|optional)>' contained

syn include @Sh syntax/sh.vim
syn region kickstartPrePost matchgroup=kickstartInclude start='\v\%(pre|post)>' end='\v\%end>' contains=kickstartComment,kickstartPrePostOption,@Sh
syn match  kickstartPrePostOption '\v--(interpreter|log)\=' contained
syn match  kickstartPrePostOption '\v--(erroronfail)>' contained

syn region  kickstartAnaconda matchgroup=kickstartInclude start='\v\%anaconda>' end='\v\%end>' contains=kickstartComment,kickstartAnacondaCommand,kickstartAnacondaOption
syn keyword kickstartAnacondaCommand pwpolicy contained
syn match   kickstartAnacondaOption '\v--(minlen|minquality)\=' contained
syn match   kickstartAnacondaOption '\v--(strict|changesok|emptyok)>' contained
syn match   kickstartAnacondaOption '\v--(notstrict|nochanges|notempty)>' contained

syn region kickstartAddon matchgroup=kickstartInclude start="^\s*%addon\>" end="^\s*%end$" contains=kickstartComment,kickstartAddonOption
syn match  kickstartAddonOption '\v--(disable|enable|enablefadump)>' contained
syn match  kickstartAddonOption '\v--reserve-mb\=' contained
"}}}

" Commands {{{
syn keyword kickstartCommand device driverdisk install upgrade
syn keyword kickstartCommand interactive mediacheck ostreesetup repo
syn keyword kickstartCommand autostep cmdline graphical text rescue
syn keyword kickstartCommand logging sshpw vnc unsupported_hardware
syn keyword kickstartCommand firstboot halt poweroff reboot shutdown
syn keyword kickstartCommand ignoredisk autopart bootloader
syn keyword kickstartCommand clearpart zerombr
syn keyword kickstartCommand btrfs fcoe iscsi iscsiname zfcp
syn keyword kickstartCommand volgroup logvol part[ition] raid reqpart
syn keyword kickstartCommand firewall network keyboard lang services
syn keyword kickstartCommand auth[config] group user sshkey realm
syn keyword kickstartCommand rootpw selinux skipx xconfig timezone
syn keyword kickstartInstallMethod cdrom harddrive liveimg nfs url
"}}}

" Enums {{{
syn keyword kickstartEnum KDE GNOME
"}}}

" Options {{{
syn match kickstartOption '\v--(enabled|enable)>'
syn match kickstartOption '\v--(disabled|disable)>'
syn match kickstartOption '\v--name\='
syn match kickstartOption '\v--opts\='
syn match kickstartOption '\v--source\='
syn match kickstartOption '\v--(biospart|partition)\='
syn match kickstartOption '\v--(server|mirrorlist|dir|url)\='
syn match kickstartOption '\v--(proxy|baseurl|checksum)\='
syn match kickstartOption '\v--(includepkgs|excludepkgs)\='
syn match kickstartOption '\v--(noverifyssl|nogpgcheck)>'
syn match kickstartOption '\v--(osname|remote|ref)\='
syn match kickstartOption '\v--(cost|ignoregroups)\='
syn match kickstartOption '\v--install'
syn match kickstartOption '\v--autoscreenshot'
syn match kickstartOption '\v--(nomount|romount)>'
syn match kickstartOption '\v--(host|port)\='
syn match kickstartOption '\v--level\='
syn match kickstartOption '\v--(username|password)\='
syn match kickstartOption '\v--(iscrypted|plaintext|lock)>'
syn match kickstartOption '\v--(reconfig|eject|kexec)>'
syn match kickstartOption '\v--(only-use|drives)\='
syn match kickstartOption '\v--(interactive|nolvm|encrypted)>'
syn match kickstartOption '\v--(type|fstype)\='
syn match kickstartOption '\v--(passphrase|backuppassphrase)\='
syn match kickstartOption '\v--(escrowcert|cipher)\='
syn match kickstartOption '\v--(location|append)\='
syn match kickstartOption '\v--(boot-drive|driveorder)\='
syn match kickstartOption '\v--(leavebootorder|extlinux|nombr)>'
syn match kickstartOption '\v--(all|linux|none)>'
syn match kickstartOption '\v--(timeout|default|list|disklabel)\='
syn match kickstartOption '\v--(data|metadata|label|mkfsoptions|nic|dcb)\='
syn match kickstartOption '\v--(subvol|noformat|useexisting|autovlan)>'
syn match kickstartOption '\v--(ipaddr|target|iface)\='
syn match kickstartOption '\v--(user|reverse-user|reverse-password)\='
syn match kickstartOption '\v--(devnum|wwpn|fcplun)\='
syn match kickstartOption '\v--(pesize|reserved-space|reserved-percent)\='
syn match kickstartOption '\v--(fsoptions|size|percent|maxsize)\='
syn match kickstartOption '\v--(metadatasize|chunksize|poolname|profile)\='
syn match kickstartOption '\v--(cachepvs|cachesize|cachemode)\='
syn match kickstartOption '\v--(grow|recommended|resize|thinpool|thin)>'
syn match kickstartOption '\v--(onpart|usepart|ondisk|ondrive)\='
syn match kickstartOption '\v--(fsprofile|spares|device)\='
syn match kickstartOption '\v--(asprimary|onbiosdisk|add-boot)>'
syn match kickstartOption '\v--(trust|service)\='
syn match kickstartOption '\v--(ssh|smtp|http|ftp)>'
syn match kickstartOption '\v--(activate|bootproto|ip|gateway|netmask)\='
syn match kickstartOption '\v--(noipv4|noipv6|nodns|nodefroute)>'
syn match kickstartOption '\v--(hostname|nameserver|interfacename)\='
syn match kickstartOption '\v--(ipv6|ipv6gateway|mtu|vlanid|onboot)\='
syn match kickstartOption '\v--(ethtool|essid|wepkey|wpakey|dhcpclass)\='
syn match kickstartOption '\v--(bondslaves|Bondopts|teamconfig)\='
syn match kickstartOption '\v--(teamslaves|bridgeslaves|bridgeopts)\='
syn match kickstartOption '\v--(vckeymap|xlayouts|switch)\='
syn match kickstartOption '\v--addsupport\='
syn match kickstartOption '\v--(enablenis|enableshadow|enableldap)>'
syn match kickstartOption '\v--(enableldapauth|enableldaptls|disableldaptls)>'
syn match kickstartOption '\v--(nisdomain|nisserver)\='
syn match kickstartOption '\v--(ldapserver|ldapbasedn)\='
syn match kickstartOption '\v--(enablekrb5|enablehesiod|enablesmbauth|enablecache)>'
syn match kickstartOption '\v--(krb5realm|krb5kdc|krb5adminserver)\='
syn match kickstartOption '\v--(hesiodlhs|hesiodrhs)\='
syn match kickstartOption '\v--(smbservers|smbworkgroup|passalgo)\='
syn match kickstartOption '\v--(groups|homedir|gecos|shell|uid|gid)\='
syn match kickstartOption '\v--(computer-ou|one-time-password)\='
syn match kickstartOption '\v--(client-software|server-software|membership-software)\='
syn match kickstartOption '\v--(no-password|enforcing|permissive)>'
syn match kickstartOption '\v--(startxonboot|utc|nontp)>'
syn match kickstartOption '\v--(defaultdesktop|ntpservers)\='
"}}}

" Highlighting {{{
highlight kickstartPackageGroup term=bold cterm=bold gui=bold

highlight link kickstartString              String
highlight link kickstartComment             Comment
highlight link kickstartTodo                Todo
highlight link kickstartInclude             Preproc
highlight link kickstartInstallMethod       Type
highlight link kickstartAnacondaCommand     kickstartCommand
highlight link kickstartCommand             Keyword
highlight link kickstartPackageOption       kickstartOption
highlight link kickstartPackageGroupOption  kickstartOption
highlight link kickstartAddonOption         kickstartOption
highlight link kickstartAnacondaOption      kickstartOption
highlight link kickstartPrePostOption       kickstartOption
highlight link kickstartOption              Identifier
highlight link kickstartModuleType          kickstartEnum
highlight link kickstartKeyboard            kickstartEnum
highlight link kickstartPackageRemove       Special
highlight link kickstartEnum                Constant
"}}}

let b:current_syntax = "kickstart"
