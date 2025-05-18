{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit DKDialogs;

{$warn 5023 off : no warning about unused units}
interface

uses
  DK_DialogImages, DK_Dialogs, DK_TextDialogForm, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('DKDialogs', @Register);
end.
