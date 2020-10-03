; NSIS script (UTF-8) NSIS-3 Unicode BadCmd=11
; Install

Unicode true
SetCompressor zlib

; --------------------
; HEADER SIZE: 28238
; START HEADER SIZE: 300
; MAX STRING LENGTH: 1024
; STRING CHARS: 4651

OutFile [NSIS].exe
!include WinMessages.nsh

ShowInstDetails show
AutoCloseWindow true
InstallDirRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\App Paths\VirtuaNES.exe" ""
LicenseBkColor /windows


; --------------------
; LANG TABLES: 2
; LANG STRINGS: 79

Name "VirtuaNES 1.0"
BrandingText "Nullsoft Install System v3.04"

; LANG: 2052
LangString LSTR_0 2052 "Nullsoft Install System v3.04"
LangString LSTR_1 2052 "$(LSTR_2) 安装"
LangString LSTR_2 2052 "VirtuaNES 1.0"
LangString LSTR_3 2052 "可用空间: "
LangString LSTR_4 2052 "所需空间: "
LangString LSTR_5 2052 "无法写入: "
LangString LSTR_8 2052 "无法找到符号: "
LangString LSTR_9 2052 "无法加载: "
LangString LSTR_10 2052 "$\"创建文件夹: $\" "
LangString LSTR_11 2052 "创建快捷方式: "
LangString LSTR_12 2052 "创建解除安装程序: "
LangString LSTR_13 2052 "删除文件: "
LangString LSTR_14 2052 "重新启动后删除: "
LangString LSTR_15 2052 "正在创建快捷方式时发生错误: "
LangString LSTR_16 2052 "正在创建时发生错误: "
LangString LSTR_17 2052 正在解压缩数据发生错误！已损坏的安装程序？
LangString LSTR_20 2052 "运行: "
LangString LSTR_21 2052 "抽取: "
LangString LSTR_22 2052 "抽取: 无法写入文件 "
LangString LSTR_23 2052 "安装损毁: 无效的操作代码 "
LangString LSTR_24 2052 "没有 OLE 用于: "
LangString LSTR_25 2052 "输出目录: "
LangString LSTR_26 2052 "移除目录: "
LangString LSTR_29 2052 "已跳过: "
LangString LSTR_30 2052 "复制细节到剪贴板 "
LangString LSTR_32 2052 B
LangString LSTR_33 2052 " K"
LangString LSTR_34 2052 " M"
LangString LSTR_35 2052 " G"
LangString LSTR_36 2052 "欢迎使用 $(LSTR_78) 安装向导"
LangString LSTR_37 2052 "这个向导将指引你完成 $(LSTR_78) 的安装进程。$\r$\n$\r$\n在开始安装之前，建议先关闭其他所有应用程序。这将允许“安装程序”更新指定的系统文件，而不需要重新启动你的计算机。$\r$\n$\r$\n$_CLICK"
LangString LSTR_38 2052 "不能打开要写入的文件: $\r$\n$\t$\"$0$\"$\r$\n单击 [Abort] 停止安装，$\r$\n [Retry] 重新尝试写入文件，或$\r$\n [Ignore] 忽略这个文件。"
LangString LSTR_39 2052 宋体
LangString LSTR_40 2052 "如果你接受协议中的条款，单击 [我同意(I)] 继续安装。必须要接受协议才能安装 $(LSTR_78) 。"
LangString LSTR_41 2052 许可证协议
LangString LSTR_42 2052 "在安装 $(LSTR_78) 之前，请检阅授权条款。"
LangString LSTR_43 2052 "检阅协议的其余部分，按 [PgDn] 往下卷动页面。"
LangString LSTR_44 2052 选定安装位置
LangString LSTR_45 2052 "选定 $(LSTR_78) 要安装的文件夹。"
LangString LSTR_46 2052 正在安装
LangString LSTR_47 2052 "$(LSTR_78) 正在安装，请等候。"
LangString LSTR_48 2052 安装完成
LangString LSTR_49 2052 安装程序已成功地运行完成。
LangString LSTR_50 2052 安装己中止
LangString LSTR_51 2052 安装程序并未成功地运行完成。
LangString LSTR_52 2052 完成(&F)
LangString LSTR_53 2052 "正在完成 $(LSTR_78) 安装向导"
LangString LSTR_54 2052 "你的系统需要重新启动，以便完成 $(LSTR_78) 的安装。现在要重新启动吗？"
LangString LSTR_55 2052 是，现在重新启动(&Y)
LangString LSTR_56 2052 否，我稍后再自行重新启动(&N)
LangString LSTR_57 2052 "$(LSTR_78) 已安装在你的系统。$\r$\n单击 [完成(F)] 关闭此向导。"
LangString LSTR_58 2052 "运行 $(LSTR_78)(&R)"
LangString LSTR_59 2052 0
LangString LSTR_60 2052 9
LangString LSTR_61 2052 "你确实要退出 $(LSTR_2) 安装程序吗？"
LangString LSTR_62 2052 自定义
LangString LSTR_63 2052 取消(&C)
LangString LSTR_64 2052 "< 上一步(&P)"
LangString LSTR_65 2052 "下一步(&N) >"
LangString LSTR_66 2052 "单击 [下一步(N)] 继续。"
LangString LSTR_67 2052 我接受(&I)
LangString LSTR_68 2052 "Setup 将安装 $(LSTR_78) 在下列文件夹。要安装到不同文件夹，单击 [浏览(B)...] 并选择其他的文件夹。 $_CLICK"
LangString LSTR_69 2052 目标文件夹
LangString LSTR_70 2052 浏览(&B)...
LangString LSTR_71 2052 "选择要安装 $(LSTR_78) 的文件夹位置: "
LangString LSTR_72 2052 安装(&I)
LangString LSTR_73 2052 "单击 [安装(I)] 开始安装进程。"
LangString LSTR_74 2052 显示细节(&D)
LangString LSTR_75 2052 已完成
LangString LSTR_76 2052 " "
LangString LSTR_77 2052 关闭(&L)
LangString LSTR_78 2052 "VirtuaNES 1.0"


; LANG: 1033
LangString LSTR_0 1033 "Nullsoft Install System v3.04"
LangString LSTR_1 1033 "$(LSTR_2) Setup"
LangString LSTR_2 1033 "VirtuaNES 1.0"
LangString LSTR_3 1033 "Space available: "
LangString LSTR_4 1033 "Space required: "
LangString LSTR_5 1033 "Can't write: "
LangString LSTR_8 1033 "Could not find symbol: "
LangString LSTR_9 1033 "Could not load: "
LangString LSTR_10 1033 "Create folder: "
LangString LSTR_11 1033 "Create shortcut: "
LangString LSTR_12 1033 "Created uninstaller: "
LangString LSTR_13 1033 "Delete file: "
LangString LSTR_14 1033 "Delete on reboot: "
LangString LSTR_15 1033 "Error creating shortcut: "
LangString LSTR_16 1033 "Error creating: "
LangString LSTR_17 1033 "Error decompressing data! Corrupted installer?"
LangString LSTR_20 1033 "Execute: "
LangString LSTR_21 1033 "Extract: "
LangString LSTR_22 1033 "Extract: error writing to file "
LangString LSTR_23 1033 "Installer corrupted: invalid opcode"
LangString LSTR_24 1033 "No OLE for: "
LangString LSTR_25 1033 "Output folder: "
LangString LSTR_26 1033 "Remove folder: "
LangString LSTR_29 1033 "Skipped: "
LangString LSTR_30 1033 "Copy Details To Clipboard"
LangString LSTR_32 1033 B
LangString LSTR_33 1033 " K"
LangString LSTR_34 1033 " M"
LangString LSTR_35 1033 " G"
LangString LSTR_36 1033 "Welcome to $(LSTR_78) Setup"
LangString LSTR_37 1033 "Setup will guide you through the installation of $(LSTR_78).$\r$\n$\r$\nIt is recommended that you close all other applications before starting Setup. This will make it possible to update relevant system files without having to reboot your computer.$\r$\n$\r$\n$_CLICK"
LangString LSTR_38 1033 "Error opening file for writing: $\r$\n$\r$\n$0$\r$\n$\r$\nClick Abort to stop the installation,$\r$\nRetry to try again, or$\r$\nIgnore to skip this file."
LangString LSTR_39 1033 "MS Shell Dlg"
LangString LSTR_40 1033 "If you accept the terms of the agreement, click I Agree to continue. You must accept the agreement to install $(LSTR_78)."
LangString LSTR_41 1033 "License Agreement"
LangString LSTR_42 1033 "Please review the license terms before installing $(LSTR_78)."
LangString LSTR_43 1033 "Press Page Down to see the rest of the agreement."
LangString LSTR_44 1033 "Choose Install Location"
LangString LSTR_45 1033 "Choose the folder in which to install $(LSTR_78)."
LangString LSTR_46 1033 Installing
LangString LSTR_47 1033 "Please wait while $(LSTR_78) is being installed."
LangString LSTR_48 1033 "Installation Complete"
LangString LSTR_49 1033 "Setup was completed successfully."
LangString LSTR_50 1033 "Installation Aborted"
LangString LSTR_51 1033 "Setup was not completed successfully."
LangString LSTR_52 1033 &Finish
LangString LSTR_53 1033 "Completing $(LSTR_78) Setup"
LangString LSTR_54 1033 "Your computer must be restarted in order to complete the installation of $(LSTR_78). Do you want to reboot now?"
LangString LSTR_55 1033 "Reboot now"
LangString LSTR_56 1033 "I want to manually reboot later"
LangString LSTR_57 1033 "$(LSTR_78) has been installed on your computer.$\r$\n$\r$\nClick Finish to close Setup."
LangString LSTR_58 1033 "&Run $(LSTR_78)"
LangString LSTR_59 1033 0
LangString LSTR_60 1033 8
LangString LSTR_61 1033 "Are you sure you want to quit $(LSTR_2) Setup?"
LangString LSTR_62 1033 Custom
LangString LSTR_63 1033 Cancel
LangString LSTR_64 1033 "< &Back"
LangString LSTR_65 1033 "&Next >"
LangString LSTR_66 1033 "Click Next to continue."
LangString LSTR_67 1033 "I &Agree"
LangString LSTR_68 1033 "Setup will install $(LSTR_78) in the following folder. To install in a different folder, click Browse and select another folder. $_CLICK"
LangString LSTR_69 1033 "Destination Folder"
LangString LSTR_70 1033 B&rowse...
LangString LSTR_71 1033 "Select the folder to install $(LSTR_78) in:"
LangString LSTR_72 1033 &Install
LangString LSTR_73 1033 "Click Install to start the installation."
LangString LSTR_74 1033 "Show &details"
LangString LSTR_75 1033 Completed
LangString LSTR_76 1033 " "
LangString LSTR_77 1033 &Close
LangString LSTR_78 1033 "VirtuaNES 1.0"


; --------------------
; VARIABLES: 4

Var _0_
Var _1_
Var _2_
Var _3_


InstType $(LSTR_62)    ;  Custom
InstallDir $PROGRAMFILES\VirtuaNES
; install_directory_auto_append = VirtuaNES
; wininit = $WINDIR\wininit.ini


; --------------------
; PAGES: 6

; Page 0
Page custom func_0 func_67 /ENABLECANCEL

; Page 1
Page license func_68 func_73 func_77 /ENABLECANCEL
  LicenseText $(LSTR_40) $(LSTR_67)    ;  "If you accept the terms of the agreement, click I Agree to continue. You must accept the agreement to install $(LSTR_78)." "I &Agree" "VirtuaNES 1.0"
  LicenseData [LICENSE].txt

; Page 2
Page directory func_78 func_83 func_84 /ENABLECANCEL
  DirText $(LSTR_68) $(LSTR_69) $(LSTR_70) $(LSTR_71)    ;  "Setup will install $(LSTR_78) in the following folder. To install in a different folder, click Browse and select another folder. $_CLICK" "Destination Folder" B&rowse... "Select the folder to install $(LSTR_78) in:" "VirtuaNES 1.0" "VirtuaNES 1.0"
  DirVar $CMDLINE

; Page 3
Page instfiles func_85 func_90 func_91
  CompletedText $(LSTR_75)    ;  Completed
  DetailsButtonText $(LSTR_74)    ;  "Show &details"

/*
; Page 4
Page COMPLETED
*/

; Page 5
Page custom func_104 func_256


; --------------------
; SECTIONS: 2
; COMMANDS: 478

Function func_0    ; Page 0, Pre
  WriteINIStr $PLUGINSDIR\ioSpecial.ini Settings NumFields 3
  WriteINIStr $PLUGINSDIR\ioSpecial.ini Settings NextButtonText ""
  WriteINIStr $PLUGINSDIR\ioSpecial.ini Settings CancelEnabled ""
  Push $(LSTR_36)    ;  "Welcome to $(LSTR_78) Setup" "VirtuaNES 1.0"
  Call func_297
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 2" Text $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 2" Bottom 38
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Top 45
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Bottom 185
  Push $(LSTR_37)    ;  "Setup will guide you through the installation of $(LSTR_78).$\r$\n$\r$\nIt is recommended that you close all other applications before starting Setup. This will make it possible to update relevant system files without having to reboot your computer.$\r$\n$\r$\n$_CLICK" "VirtuaNES 1.0"
  Call func_297
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Text $_0_
  LockWindow on
  GetDlgItem $_0_ $HWNDPARENT 1028
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1256
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1035
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1037
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1038
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1039
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1045
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  LockWindow off
  InstallOptions::initDialog $PLUGINSDIR\ioSpecial.ini
    ; Call Initialize_____Plugins
    ; SetOverwrite off
    ; File $PLUGINSDIR\InstallOptions.dll
    ; SetDetailsPrint lastused
    ; Push $PLUGINSDIR\ioSpecial.ini
    ; CallInstDLL $PLUGINSDIR\InstallOptions.dll initDialog
  Pop $_2_
  SetCtlColors $_2_ 0x000000 0xFFFFFF
  GetDlgItem $_0_ $_2_ 1201
  SetCtlColors $_0_ 0x000000 0xFFFFFF
  CreateFont $_1_ $(LSTR_39) 12 700    ;  "MS Shell Dlg"
  SendMessage $_0_ ${WM_SETFONT} $_1_ 0
  GetDlgItem $_0_ $_2_ 1202
  SetCtlColors $_0_ 0x000000 0xFFFFFF
  Push $0
  InstallOptions::show
    ; Call Initialize_____Plugins
    ; AllowSkipFiles off
    ; File $PLUGINSDIR\InstallOptions.dll
    ; SetDetailsPrint lastused
    ; CallInstDLL $PLUGINSDIR\InstallOptions.dll show
  Pop $0
  Pop $0
  LockWindow on
  GetDlgItem $_0_ $HWNDPARENT 1028
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1256
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1035
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1037
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1038
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1039
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1045
  ShowWindow $_0_ ${SW_HIDE}
  LockWindow off
FunctionEnd


Function func_67    ; Page 0, Leave
FunctionEnd


Function func_68    ; Page 1, Pre
  GetDlgItem $_0_ $HWNDPARENT 1037
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_41)    ;  "License Agreement"
  GetDlgItem $_0_ $HWNDPARENT 1038
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_42)    ;  "Please review the license terms before installing $(LSTR_78)." "VirtuaNES 1.0"
FunctionEnd


Function func_73    ; Page 1, Show
  FindWindow $_0_ "#32770" "" $HWNDPARENT
  GetDlgItem $_0_ $_0_ 1040
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_43)    ;  "Press Page Down to see the rest of the agreement."
FunctionEnd


Function func_77    ; Page 1, Leave
FunctionEnd


Function func_78    ; Page 2, Pre
  GetDlgItem $_0_ $HWNDPARENT 1037
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_44)    ;  "Choose Install Location"
  GetDlgItem $_0_ $HWNDPARENT 1038
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_45)    ;  "Choose the folder in which to install $(LSTR_78)." "VirtuaNES 1.0"
FunctionEnd


Function func_83    ; Page 2, Show
FunctionEnd


Function func_84    ; Page 2, Leave
FunctionEnd


Function func_85    ; Page 3, Pre
  GetDlgItem $_0_ $HWNDPARENT 1037
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_46)    ;  Installing
  GetDlgItem $_0_ $HWNDPARENT 1038
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_47)    ;  "Please wait while $(LSTR_78) is being installed." "VirtuaNES 1.0"
FunctionEnd


Function func_90    ; Page 3, Show
FunctionEnd


Function func_91    ; Page 3, Leave
  IfAbort label_97
  GetDlgItem $_0_ $HWNDPARENT 1037
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_48)    ;  "Installation Complete"
  GetDlgItem $_0_ $HWNDPARENT 1038
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_49)    ;  "Setup was completed successfully."
  Goto label_101
label_97:
  GetDlgItem $_0_ $HWNDPARENT 1037
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_50)    ;  "Installation Aborted"
  GetDlgItem $_0_ $HWNDPARENT 1038
  SendMessage $_0_ ${WM_SETTEXT} 0 STR:$(LSTR_51)    ;  "Setup was not completed successfully."
label_101:
  IfAbort label_103
  WriteRegStr HKLM Software\Microsoft\Windows\CurrentVersion\Uninstall\VirtuaNES NSIS:Language $LANGUAGE
label_103:
FunctionEnd


Function func_104    ; Page 5, Pre
  Push $(LSTR_52)    ;  &Finish
  Call func_297
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini Settings NextButtonText $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 2" Bottom 38
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Top 45
  Push $(LSTR_53)    ;  "Completing $(LSTR_78) Setup" "VirtuaNES 1.0"
  Call func_297
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 2" Text $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Bottom 85
  IfRebootFlag 0 label_143
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Bottom 85
  Push $(LSTR_54)    ;  "Your computer must be restarted in order to complete the installation of $(LSTR_78). Do you want to reboot now?" "VirtuaNES 1.0"
  Call func_297
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Text $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini Settings Numfields 5
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Type RadioButton
  Push $(LSTR_55)    ;  "Reboot now"
  Call func_297
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Text $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Left 120
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Right 321
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Top 90
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Bottom 100
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 5" Type RadioButton
  Push $(LSTR_56)    ;  "I want to manually reboot later"
  Call func_297
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 5" Text $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 5" Left 120
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 5" Right 321
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 5" Top 110
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 5" Bottom 120
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" State 1
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 5" State 0
  Goto label_158
label_143:
  Push $(LSTR_57)    ;  "$(LSTR_78) has been installed on your computer.$\r$\n$\r$\nClick Finish to close Setup." "VirtuaNES 1.0"
  Call func_297
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 3" Text $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Type CheckBox
  Push $(LSTR_58)    ;  "&Run $(LSTR_78)" "VirtuaNES 1.0"
  Call func_297
  Pop $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Text $_0_
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Left 120
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Right 315
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Top 90
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" Bottom 100
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 4" State 1
  WriteINIStr $PLUGINSDIR\ioSpecial.ini Settings Numfields 4
label_158:
  LockWindow on
  GetDlgItem $_0_ $HWNDPARENT 1028
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1256
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1035
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1037
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1038
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1039
  ShowWindow $_0_ ${SW_HIDE}
  GetDlgItem $_0_ $HWNDPARENT 1045
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  LockWindow off
  InstallOptions::initDialog $PLUGINSDIR\ioSpecial.ini
    ; Call Initialize_____Plugins
    ; File $PLUGINSDIR\InstallOptions.dll
    ; SetDetailsPrint lastused
    ; Push $PLUGINSDIR\ioSpecial.ini
    ; CallInstDLL $PLUGINSDIR\InstallOptions.dll initDialog
  Pop $_2_
  SetCtlColors $_2_ 0x000000 0xFFFFFF
  GetDlgItem $_0_ $_2_ 1201
  SetCtlColors $_0_ 0x000000 0xFFFFFF
  CreateFont $_1_ $(LSTR_39) 12 700    ;  "MS Shell Dlg"
  SendMessage $_0_ ${WM_SETFONT} $_1_ 0
  GetDlgItem $_0_ $_2_ 1202
  SetCtlColors $_0_ 0x000000 0xFFFFFF
  IfRebootFlag 0 label_193
  GetDlgItem $_0_ $_2_ 1203
  SetCtlColors $_0_ 0x000000 0xFFFFFF
  GetDlgItem $_0_ $_2_ 1204
  SetCtlColors $_0_ 0x000000 0xFFFFFF
  Goto label_195
label_193:
  GetDlgItem $_0_ $_2_ 1203
  SetCtlColors $_0_ 0x000000 0xFFFFFF
label_195:
  Push $1
  System::Call *(i12,i0,p)p.r1
    ; Call Initialize_____Plugins
    ; AllowSkipFiles on
    ; File $PLUGINSDIR\System.dll
    ; SetDetailsPrint lastused
    ; Push *(i12,i0,p)p.r1
    ; CallInstDLL $PLUGINSDIR\System.dll Call
  System::Call USER32::SystemParametersInfo(i0x42,i12,pr1,i0)
    ; Call Initialize_____Plugins
    ; AllowSkipFiles off
    ; File $PLUGINSDIR\System.dll
    ; SetDetailsPrint lastused
    ; Push USER32::SystemParametersInfo(i0x42,i12,pr1,i0)
    ; CallInstDLL $PLUGINSDIR\System.dll Call
  System::Call *$1(i,i.s)
    ; Call Initialize_____Plugins
    ; File $PLUGINSDIR\System.dll
    ; SetDetailsPrint lastused
    ; Push *$1(i,i.s)
    ; CallInstDLL $PLUGINSDIR\System.dll Call
  Pop $_3_
  System::Free $1
    ; Call Initialize_____Plugins
    ; File $PLUGINSDIR\System.dll
    ; SetDetailsPrint lastused
    ; Push $1
    ; CallInstDLL $PLUGINSDIR\System.dll Free
  Pop $1
  IntOp $_3_ $_3_ & 0x01
  IntCmp $_3_ 0 label_232
  GetDlgItem $_0_ $_2_ 1203
  System::Call "UXTHEME::SetWindowTheme(p$_0_,w$\" $\",w$\" $\")"
    ; Call Initialize_____Plugins
    ; File $PLUGINSDIR\System.dll
    ; SetDetailsPrint lastused
    ; Push "UXTHEME::SetWindowTheme(p$_0_,w$\" $\",w$\" $\")"
    ; CallInstDLL $PLUGINSDIR\System.dll Call
  GetDlgItem $_0_ $_2_ 1204
  System::Call "UXTHEME::SetWindowTheme(p$_0_,w$\" $\",w$\" $\")"
    ; Call Initialize_____Plugins
    ; File $PLUGINSDIR\System.dll
    ; SetDetailsPrint lastused
    ; Push "UXTHEME::SetWindowTheme(p$_0_,w$\" $\",w$\" $\")"
    ; CallInstDLL $PLUGINSDIR\System.dll Call
label_232:
  Push $0
  InstallOptions::show
    ; Call Initialize_____Plugins
    ; File $PLUGINSDIR\InstallOptions.dll
    ; SetDetailsPrint lastused
    ; CallInstDLL $PLUGINSDIR\InstallOptions.dll show
  Pop $0
  Pop $0
  LockWindow on
  GetDlgItem $_0_ $HWNDPARENT 1028
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1256
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1035
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1037
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1038
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1039
  ShowWindow $_0_ ${SW_SHOWNORMAL}
  GetDlgItem $_0_ $HWNDPARENT 1045
  ShowWindow $_0_ ${SW_HIDE}
  LockWindow off
FunctionEnd


Function func_256    ; Page 5, Leave
  IfRebootFlag 0 label_262
  ReadINIStr $_0_ $PLUGINSDIR\ioSpecial.ini "Field 4" State
  StrCmp $_0_ 1 0 label_261
  Reboot
    ; Quit
label_261:
  Return

label_262:
  ReadINIStr $_0_ $PLUGINSDIR\ioSpecial.ini "Field 4" State
  StrCmp $_0_ 1 0 label_266
  StrCpy $_0_ $\"$INSTDIR\VirtuaNES.exe$\"
  Exec $_0_
label_266:
FunctionEnd


Function .onGUIInit
  InitPluginsDir
    ; Call Initialize_____Plugins
    ; SetDetailsPrint lastused
  SetOverwrite on
  AllowSkipFiles on
  File $PLUGINSDIR\ioSpecial.ini
  InstallOptions::make_unicode $PLUGINSDIR\ioSpecial.ini
    ; Call Initialize_____Plugins
    ; SetOverwrite off
    ; AllowSkipFiles off
    ; File $PLUGINSDIR\InstallOptions.dll
    ; SetDetailsPrint lastused
    ; Push $PLUGINSDIR\ioSpecial.ini
    ; CallInstDLL $PLUGINSDIR\InstallOptions.dll make_unicode
  WriteINIStr $PLUGINSDIR\ioSpecial.ini Settings RTL $(LSTR_59)    ;  0
  SetOverwrite on
  AllowSkipFiles on
  File $PLUGINSDIR\modern-wizard.bmp
  WriteINIStr $PLUGINSDIR\ioSpecial.ini "Field 1" Text $PLUGINSDIR\modern-wizard.bmp
  GetDlgItem $_0_ $HWNDPARENT 1037
  CreateFont $_1_ $(LSTR_39) $(LSTR_60) 700    ;  "MS Shell Dlg" 8
  SendMessage $_0_ ${WM_SETFONT} $_1_ 0
  SetCtlColors $_0_ 0x000000 0xFFFFFF
  GetDlgItem $_0_ $HWNDPARENT 1038
  SetCtlColors $_0_ 0x000000 0xFFFFFF
  GetDlgItem $_0_ $HWNDPARENT 1034
  SetCtlColors $_0_ "" 0xFFFFFF
  GetDlgItem $_0_ $HWNDPARENT 1039
  SetCtlColors $_0_ "" 0xFFFFFF
  GetDlgItem $_0_ $HWNDPARENT 1028
  SetCtlColors $_0_ /BRANDING ""
  GetDlgItem $_0_ $HWNDPARENT 1256
  SetCtlColors $_0_ /BRANDING ""
  SendMessage $_0_ ${WM_SETTEXT} 0 "STR:$(LSTR_0) "    ;  "Nullsoft Install System v3.04"
FunctionEnd


Function .onUserAbort
  MessageBox MB_YESNO|MB_ICONEXCLAMATION $(LSTR_61) IDYES label_296    ;  "Are you sure you want to quit $(LSTR_2) Setup?" "VirtuaNES 1.0"
  Abort
label_296:
FunctionEnd


Function func_297
  Exch $0
    ; Push $0
    ; Exch
    ; Pop $0
  Push $1
  Push $2
  Push $3
  Push $4
  StrCpy $1 ""
  StrLen $3 $0
  IntOp $3 $3 - 1
  StrCpy $4 0
  Goto label_310
label_309:
  IntOp $4 $4 + 1
label_310:
  IntCmp $4 $3 0 0 label_327
  StrCpy $2 $0 1 $4
  StrCmp $2 \ 0 label_315
  StrCpy $2 \\
  Goto label_323
label_315:
  StrCmp $2 $\r 0 label_318
  StrCpy $2 \r
  Goto label_323
label_318:
  StrCmp $2 $\n 0 label_321
  StrCpy $2 \n
  Goto label_323
label_321:
  StrCmp $2 $\t 0 label_323
  StrCpy $2 \t
label_323:
  StrCpy $1 $1$2
  Goto label_309
  Goto label_309
  Goto label_327
label_327:
  StrCpy $0 $1
  Pop $4
  Pop $3
  Pop $2
  Pop $1
  Exch $0
    ; Push $0
    ; Exch
    ; Pop $0
FunctionEnd


Function .onInit
  ReadRegStr $_0_ HKLM Software\Microsoft\Windows\CurrentVersion\Uninstall\VirtuaNES NSIS:Language
  StrCmp $_0_ "" label_340
  StrCpy $LANGUAGE $_0_
  Goto label_358
label_340:
  IfSilent label_358
  LangDLL::LangDialog "Installer Language" "Please select a language." AC 中文(简体) 2052 936 English 1033 1252 ""
    ; Call Initialize_____Plugins
    ; SetOverwrite off
    ; File $PLUGINSDIR\LangDLL.dll
    ; SetDetailsPrint lastused
    ; Push ""
    ; Push 1252
    ; Push 1033
    ; Push English
    ; Push 936
    ; Push 2052
    ; Push 中文(简体)
    ; Push AC
    ; Push "Please select a language."
    ; Push "Installer Language"
    ; CallInstDLL $PLUGINSDIR\LangDLL.dll LangDialog
  Pop $LANGUAGE
  StrCmp $LANGUAGE cancel 0 label_358
  Abort
label_358:
FunctionEnd


Section MainSection ; Section_0
  ; AddSize 1056
  SetOutPath $INSTDIR\CheatCode
  SetOverwrite try
  File "Castlevania (E).gen"
  File SpartanX.vct
  File "Super Mario Bros (E).gen"
  SetOutPath $INSTDIR
  File Chinese.vlp
  SetOutPath $INSTDIR\Doc
  File AVIconv_E.txt
  File Cheat_E.txt
  File ExtSound_E.txt
  File History_E.txt
  File Mappers.txt
  File NetPlay_E.txt
  File Readme_E.txt
  SetOutPath $INSTDIR\game
  File chiseyaosai.nes
  SetOutPath $INSTDIR
  File VirtuaNES.exe
  CreateDirectory $SMPROGRAMS\VirtuaNES
  CreateShortCut $SMPROGRAMS\VirtuaNES\VirtuaNES.lnk $INSTDIR\VirtuaNES.exe
  CreateShortCut $DESKTOP\VirtuaNES.lnk $INSTDIR\VirtuaNES.exe
  File VirtuaNES.ini
  Dialogs::InputBox 1 请输入key "Input your key" 确定 取消 4 6
    ; Call Initialize_____Plugins
    ; SetOverwrite off
    ; File $PLUGINSDIR\Dialogs.dll
    ; SetDetailsPrint lastused
    ; Push 6
    ; Push 4
    ; Push 取消
    ; Push 确定
    ; Push "Input your key"
    ; Push 请输入key
    ; Push 1
    ; CallInstDLL $PLUGINSDIR\Dialogs.dll InputBox
  DetailPrint "Checking...: $6"
  IntCmp $4 1 0 label_415 label_415
  StrCmp $6 NSIISSOEASY 0 label_415
  MessageBox MB_OK key正确
  Dialogs::InputBox 1 请输入flag "Input your flag" 确定 取消 4 6
    ; Call Initialize_____Plugins
    ; AllowSkipFiles off
    ; File $PLUGINSDIR\Dialogs.dll
    ; SetDetailsPrint lastused
    ; Push 6
    ; Push 4
    ; Push 取消
    ; Push 确定
    ; Push "Input your flag"
    ; Push 请输入flag
    ; Push 1
    ; CallInstDLL $PLUGINSDIR\Dialogs.dll InputBox
  IntCmp $4 1 0 label_415 label_415
  Push $6
  Call func_429
  Pop $6
  StrCpy $3 gm`fzd787`7bb,g72d,592b,8`g1,cg96813e8d``|
  StrCmp $3 $6 0 label_417
  MessageBox MB_OK flag正确,可以愉快的玩游戏了
  Goto label_419
label_415:
  MessageBox MB_OK 错误的key
  MessageBox MB_OK 想办法找到正确的key把
label_417:
  MessageBox MB_OK flag错误
  MessageBox MB_OK 想办法找到正确的flag把
label_419:
SectionEnd


Section ; Section_1
  WriteUninstaller $INSTDIR\uninst.exe ;  $INSTDIR\$INSTDIR\uninst.exe    ; !!! ERROR: SKIP possible BadCmd
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\App Paths\VirtuaNES.exe" "" $INSTDIR\VirtuaNES.exe
  WriteRegStr HKLM Software\Microsoft\Windows\CurrentVersion\Uninstall\VirtuaNES DisplayName $(LSTR_2)    ;  "VirtuaNES 1.0"
  WriteRegStr HKLM Software\Microsoft\Windows\CurrentVersion\Uninstall\VirtuaNES UninstallString $INSTDIR\uninst.exe
  WriteRegStr HKLM Software\Microsoft\Windows\CurrentVersion\Uninstall\VirtuaNES DisplayIcon $INSTDIR\VirtuaNES.exe
  WriteRegStr HKLM Software\Microsoft\Windows\CurrentVersion\Uninstall\VirtuaNES DisplayVersion 1.0
  WriteRegStr HKLM Software\Microsoft\Windows\CurrentVersion\Uninstall\VirtuaNES URLInfoAbout http://www.baidu.com
  WriteRegStr HKLM Software\Microsoft\Windows\CurrentVersion\Uninstall\VirtuaNES Publisher Ginkgo.
SectionEnd


Function func_429
  Pop $9
  StrCpy $3 ""
  StrCpy $0 $9
  StrCpy $1 0
label_433:
  StrCpy $2 $0 1 $1
  StrCmp $2 "" label_443
  Push $2
  Call func_445
  Pop $2
  IntOp $2 $2 ^ 1
  IntFmt $2 %c $2
  IntOp $1 $1 + 1
  StrCpy $3 $3$2
  Goto label_433
label_443:
  Push $3
FunctionEnd


Function func_445
  Exch $0
    ; Push $0
    ; Exch
    ; Pop $0
  Push $1
  Push $2
  StrCpy $2 1
label_451:
  IntFmt $1 %c $2
  StrCmpS $1 $0 0 label_455
  StrCpy $0 $2
  Goto label_458
label_455:
  IntOp $2 $2 + 1
  StrCmp $2 255 0 label_451
  StrCpy $0 0
label_458:
  Pop $2
  Pop $1
  Exch $0
    ; Push $0
    ; Exch
    ; Pop $0
FunctionEnd


/*
Function Initialize_____Plugins
  SetDetailsPrint none
  StrCmp $PLUGINSDIR "" 0 label_474
  Push $0
  SetErrors
  GetTempFileName $0
  Delete $0
  CreateDirectory $0 ; !!!! Unknown Params:  $0 "" ProgramFilesDir   ; 283 0 1
  IfErrors label_475
  StrCpy $PLUGINSDIR $0
  Pop $0
label_474:
  Return

label_475:
  MessageBox MB_OK|MB_ICONSTOP "Error! Can't initialize plug-ins directory. Please try again later." /SD IDOK
  Quit
FunctionEnd
*/



; --------------------
; UNREFERENCED STRINGS:

/*
17 CommonFilesDir
49 $PROGRAMFILES
52 "$PROGRAMFILES\Common Files"
68 $COMMONFILES
*/
