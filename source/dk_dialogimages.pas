unit DK_DialogImages;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Controls, Buttons,
  DK_CtrlUtils;

type

  { TDKDialogImages }

  TDKDialogImages = class(TDataModule)
    Images: TImageList;
    PX24: TImageList;
    PX30: TImageList;
    PX36: TImageList;
    PX42: TImageList;
  private

  public
    procedure ToButtons(const AButtons: array of TSpeedButton);
  end;

var
  DKDialogImages: TDKDialogImages;

implementation

{$R *.lfm}

{ TDKDialogImages }

procedure TDKDialogImages.ToButtons(const AButtons: array of TSpeedButton);
var
  i: Integer;
  L: TImageList;
begin
  L:= ChooseImageListForScreenPPI(PX24, PX30, PX36, PX42);
  for i:= 0 to High(AButtons) do
    AButtons[i].Images:= L;
end;

end.

