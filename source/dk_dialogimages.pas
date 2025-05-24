unit DK_DialogImages;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Controls, Buttons,
  DK_CtrlUtils;

type

  { TDKDialogImages }

  TDKDialogImages = class(TDataModule)
    Marks64: TImageList;
    Marks56: TImageList;
    Marks36: TImageList;
    Marks48: TImageList;
    Glyphs24: TImageList;
    Glyphs30: TImageList;
    Glyphs36: TImageList;
    Glyphs42: TImageList;
  private

  public
    procedure ToButtons(const AButtons: array of TSpeedButton);
    procedure ToMark({%H-}AImages: TImageList);
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
  L:= ChooseImageListForScreenPPI(Glyphs24, Glyphs30, Glyphs36, Glyphs42);
  for i:= 0 to High(AButtons) do
    AButtons[i].Images:= L;
end;

procedure TDKDialogImages.ToMark(AImages: TImageList);
begin
  AImages:= ChooseImageListForScreenPPI(Marks36, Marks48, Marks56, Marks64);
end;

end.

