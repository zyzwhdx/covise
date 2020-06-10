; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define ICONFILE GetEnv("COVISEDIR")+"/share/covise/icons/covise.ico"
#define COVISEDIR GetEnv("COVISEDIR")
#define EXTERNLIBS GetEnv("EXTERNLIBS")
#define COMMONDIR GetEnv("COVISEDIR") +"\..\common"
#define ARCHSUFFIX GetEnv("COVISE_ARCHSUFFIX")
#define MAXDIR "c:/Program Files/Autodesk/3ds Max 2020"

#if ARCHSUFFIX == ""
  #define ARCHSUFFIX GetEnv("ARCHSUFFIX")
#endif

#if ARCHSUFFIX == "zackel"
#define MAXDIR GetEnv("3DSMAX32INSTALLDIR")
#elif ARCHSUFFIX == "zackelopt"
#define MAXDIR GetEnv("3DSMAX32INSTALLDIR")
#endif

[Setup]
;compiler-related
PrivilegesRequired=admin

OutputDir={#COVISEDIR+"\DIST"}    

#if ARCHSUFFIX == "zebuopt"
OutputBaseFilename=HLRS_Max2021.1_x64_VRML_Exporter   
ArchitecturesInstallIn64BitMode="x64"  
#elif ARCHSUFFIX == "zackelopt"
OutputBaseFilename=HLRS_Max2013_x86_VRML_Exporter
#elif ARCHSUFFIX == "yoroo"
OutputBaseFilename=HLRS_Max2013_x86_VRML_Exporter
#elif ARCHSUFFIX == "yorooopt"
OutputBaseFilename=HLRS_Max2013_x86_VRML_Exporter
#else
OutputBaseFilename=HLRS_Max2021.1_x64_VRML_Exporter    
ArchitecturesInstallIn64BitMode="x64"  
ProcessorsAllowed="x64"
#endif

;installer-related
AppName=VrmlExp
AppVerName=HLRS Version of the Vrml exporter for 3ds Max 2021
AppPublisher=HLRS
AppPublisherURL=http://www.hlrs.de
AppSupportURL=http://www.hlrs.de/covise
AppUpdatesURL=http://www.hlrs.de/covise/support/download

ChangesAssociations=false
ChangesEnvironment=false
DefaultDirName={autopf}\VrmlExp
DefaultGroupName=VrmlExp
DisableStartupPrompt=false
; cosmetic
;#emit ICONFILE
SetupIconFile={#ICONFILE}
ShowLanguageDialog=yes

[Files]

Source: {#COVISEDIR}\src\tools\vrmlexp\README.txt; DestDir: {app}; DestName: README.txt
Source: {#MAXDIR}\stdplugs\vrmlexp.dle; DestDir: {app}
Source: {#EXTERNLIBS}\cal3d\bin\cal3d.dll; DestDir: {app}; Flags: recursesubdirs
Source: {#EXTERNLIBS}\OpenSceneGraph\bin\ot21-OpenThreads.dll; DestDir: {app}; Flags: recursesubdirs
#if ARCHSUFFIX == "vista"
Source: {#EXTERNLIBS}\runtime\vcredist_x86_sp1.exe; DestDir: {app}; Flags: recursesubdirs
#elif ARCHSUFFIX == "vistaopt"
Source: {#EXTERNLIBS}\runtime\vcredist_x86_sp1.exe; DestDir: {app}; Flags: recursesubdirs
#elif ARCHSUFFIX == "amdwin64"
Source: {#EXTERNLIBS}\runtime\vcredist_x64_sp1.exe; DestDir: {app}; Flags: recursesubdirs
#elif ARCHSUFFIX == "amdwin64opt"
Source: {#EXTERNLIBS}\runtime\vcredist_x64_sp1.exe; DestDir: {app}; Flags: recursesubdirs
#elif ARCHSUFFIX == "angus"
Source: {#EXTERNLIBS}\runtime\vcredist_x64.exe; DestDir: {app}; Flags: recursesubdirs
#elif ARCHSUFFIX == "angusopt"
Source: {#EXTERNLIBS}\runtime\vcredist_x64.exe; DestDir: {app}; Flags: recursesubdirs
#elif ARCHSUFFIX == "zackel"
Source: {#EXTERNLIBS}\runtime\vcredist_x86.exe; DestDir: {app}; Flags: recursesubdirs
#elif ARCHSUFFIX == "zackelopt"
Source: {#EXTERNLIBS}\runtime\vcredist_x86.exe; DestDir: {app}; Flags: recursesubdirs
#elif ARCHSUFFIX == "yoroo"
Source: {#EXTERNLIBS}\runtime\vcredist_x86.exe; DestDir: {app}; Flags: recursesubdirs
#elif ARCHSUFFIX == "yorooopt"
Source: {#EXTERNLIBS}\runtime\vcredist_x86.exe; DestDir: {app}; Flags: recursesubdirs 
#elif ARCHSUFFIX == "zebuopt"          
Source: {#EXTERNLIBS}\runtime\VC_redist.x64.exe; DestDir: {app}; Flags: recursesubdirs 
#endif


[Run]
Filename: notepad.exe; Parameters: {app}\README.txt; Description: Show README; Flags: nowait postinstall skipifsilent
; Filename: cp; Parameters: {code:GetMaxDir}\stdplugs\vrmlexp.dle {app}\vrmlexp.dle.bck; Description: backup original plugin; Flags: shellexec postinstall
; Filename: cp; Parameters: {app}\vrmlexp.dle {code:GetMaxDir}\stdplugs; Description: install plugin; Flags: shellexec postinstall
#if ARCHSUFFIX == "vista"
Filename: {app}\vcredist_x86_sp1.exe; Description: Install VisualStudio 2005 Runtime; Flags: postinstall
#elif ARCHSUFFIX == "vistaopt"
Filename: {app}\vcredist_x86_sp1.exe; Description: Install VisualStudio 2005 Runtime; Flags: postinstall
#elif ARCHSUFFIX == "amdwin64"
Filename: {app}\vcredist_x64_sp1.exe; Description: Install VisualStudio 2005 Runtime; Flags: postinstall
#elif ARCHSUFFIX == "amdwin64opt"
Filename: {app}\vcredist_x64_sp1.exe; Description: Install VisualStudio 2005 Runtime; Flags: postinstall
#elif ARCHSUFFIX == "angus"
Filename: {app}\vcredist_x64.exe; Description: Install VisualStudio 2008 Runtime; Flags: postinstall
#elif ARCHSUFFIX == "angusopt"
Filename: {app}\vcredist_x64.exe; Description: Install VisualStudio 2008 Runtime; Flags: postinstall
#elif ARCHSUFFIX == "zackel"
Filename: {app}\vcredist_x86.exe; Description: Install VisualStudio 2008 Runtime; Flags: postinstall
#elif ARCHSUFFIX == "zackelopt"
Filename: {app}\vcredist_x86.exe; Description: Install VisualStudio 2008 Runtime; Flags: postinstall     
#elif ARCHSUFFIX == "zebuopt"        
Filename: {app}\bin\VC_redist.x64.exe; Parameters: /Q; Description: Install VisualStudio 2015-2019 Runtime; Flags: postinstall  
#endif

[Code]

program Setup;

var
  MaxVersion: Integer;
  MaxDir: String;





var

  MaxDirPage: TInputDirWizardPage;




procedure CurStepChanged(CurStep: TSetupStep);
begin
    if(CurStep = ssPostInstall) then
    begin
        if(FileCopy(MaxDirPage.Values[0]+'\stdplugs\vrmlexp.dle', ExpandConstant('{app}')+'\vrmlexp.dle.bak' ,false)= false) then
        begin
            MsgBox('failed to create backup compy of '+MaxDirPage.Values[0]+'\stdplugs\vrmlexp.dle', mbInformation, MB_OK);
        end;
        if(FileCopy(ExpandConstant('{app}')+'\vrmlexp.dle', MaxDirPage.Values[0]+'\stdplugs\vrmlexp.dle' ,false)= false) then
        begin
            MsgBox('failed to install vrmlexp.dle in '+MaxDirPage.Values[0]+'\stdplugs', mbInformation, MB_OK);
        end;
        if(FileCopy(ExpandConstant('{app}')+'\cal3d.dll', MaxDirPage.Values[0]+'\cal3d.dll' ,false)= false) then
        begin
            MsgBox('failed to install cal3d.dll in '+MaxDirPage.Values[0], mbInformation, MB_OK);
        end;  
        if(FileCopy(ExpandConstant('{app}')+'\ot21-OpenThreads.dll', MaxDirPage.Values[0]+'\ot21-OpenThreads.dll' ,false)= false) then
        begin
            MsgBox('failed to install ot21-OpenThreads.dll in '+MaxDirPage.Values[0], mbInformation, MB_OK);
        end;

    end;
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo,
  MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  S: String;
begin
  { Fill the 'Ready Memo' with the normal settings and the custom settings }
  S := 'Files will be installed in:' + NewLine;
  S := S + Space +ExpandConstant('{app}')+ NewLine;
  S := S + 'Plugin will be isntalled in:'+ NewLine;
  S := S + Space + MaxDirPage.Values[0] + ' (3ds Max directory)' + NewLine;

  Result := S;
end;

procedure CreateTheWizardPages;
begin
  { TButton and others }

  MaxDirPage := CreateInputDirPage(wpSelectDir,
    'Select 3ds Max Directory', 'Where is 3ds Max installed?',
    'Select the 3ds Max folder where setup should install the plugin.'#13#10#13#10 +    'To continue, click Next. If you would like to select a different 3ds Max installation, click Browse.',
    False, '');
  MaxDirPage.Add('');
  MaxDirPage.Values[0] := MaxDir;

  {Page := CreateCustomPage(wpWelcome, 'Exporter Installation', '3ds Max directory');

  Lbl11 := TLabel.Create(Page);
  Lbl11.Caption :='This is a non commercial version of the HLRS Vrml Exporter, redistribution is not allowed';
  Lbl11.AutoSize := True;
  Lbl11.Parent := Page.Surface;

    if IsAdminLoggedOn then
    begin
    end else begin
  CheckInstallRemoteDaemon.Top := Lbl11.Top + Lbl11.Height + ScaleY(8);
  Lbl12 := TLabel.Create(Page);
  Lbl12.Caption :='Administrator right are needed to install the Visual Studio runtime, please ask your administrator to install the runtime libraries';
  Lbl12.AutoSize := True;
  Lbl12.Parent := Page.Surface;
  end;}


end;

procedure AboutButtonOnClick(Sender: TObject);
begin
  MsgBox('This Wizard allows to install the 3ds Max plugin', mbInformation, mb_Ok);
end;

procedure URLLabelOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
  ShellExec('open', 'http://www.hlrs.de/organization/vis', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

function InitializeSetup(): Boolean;
begin
  MaxVersion:=0;
  Result:=true;
                               
      
  if(RegQueryStringValue(HKLM64,'SOFTWARE\Autodesk\3dsMax\23.0','Installdir',MaxDir)) then
      begin
          MaxVersion:=23;    
      end;
  
  if MaxVersion = 0 then
  begin
      Result:=false;
      MsgBox('Did not find 3ds Max, please install 3ds Max 2021.1 first!', mbError, MB_OK);
  end;

end;

procedure InitializeWizard();
var
  AboutButton, CancelButton: TButton;
  URLLabel: TNewStaticText;
  BackgroundBitmapImage: TBitmapImage;
  BackgroundBitmapText: TNewStaticText;
begin
  { Custom wizard pages }

  { Other custom controls }


  CreateTheWizardPages;

  CancelButton := WizardForm.CancelButton;

  AboutButton := TButton.Create(WizardForm);
  AboutButton.Left := WizardForm.ClientWidth - CancelButton.Left - CancelButton.Width;
  AboutButton.Top := CancelButton.Top;
  AboutButton.Width := CancelButton.Width;
  AboutButton.Height := CancelButton.Height;
  AboutButton.Caption := '&About...';
  AboutButton.OnClick := @AboutButtonOnClick;
  AboutButton.Parent := WizardForm;

  URLLabel := TNewStaticText.Create(WizardForm);
  URLLabel.Caption := 'www.hlrs.de';
  URLLabel.Cursor := crHand;
  URLLabel.OnClick := @URLLabelOnClick;
  URLLabel.Parent := WizardForm;
  { Alter Font *after* setting Parent so the correct defaults are inherited first }
  URLLabel.Font.Style := URLLabel.Font.Style + [fsUnderline];
  URLLabel.Font.Color := clBlue;
  URLLabel.Top := AboutButton.Top + AboutButton.Height - URLLabel.Height - 2;
  URLLabel.Left := AboutButton.Left + AboutButton.Width + ScaleX(20);

  BackgroundBitmapImage := TBitmapImage.Create(MainForm);
  BackgroundBitmapImage.Left := 50;
  BackgroundBitmapImage.Top := 100;
  BackgroundBitmapImage.AutoSize := True;
  BackgroundBitmapImage.Bitmap := WizardForm.WizardBitmapImage.Bitmap;
  BackgroundBitmapImage.Parent := MainForm;

  BackgroundBitmapText := TNewStaticText.Create(MainForm);
  BackgroundBitmapText.Left := BackgroundBitmapImage.Left;
  BackgroundBitmapText.Top := BackgroundBitmapImage.Top + BackgroundBitmapImage.Height + ScaleY(8);
  BackgroundBitmapText.Caption := 'TBitmapImage';
  BackgroundBitmapText.Parent := MainForm;
end;


begin
end.
