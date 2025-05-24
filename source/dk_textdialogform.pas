unit DK_TextDialogForm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons,
  DK_DialogImages, DK_CtrlUtils;

type

  { TDKTextDialogForm }

  TDKTextDialogForm = class(TForm)
    ButtonPanel: TPanel;
    ButtonPanelBevel: TBevel;
    CancelButton: TSpeedButton;
    Image: TImage;
    ImagePanel: TPanel;
    TextLabel: TLabel;
    MainPanel: TPanel;
    YesButton: TSpeedButton;
    NoButton: TSpeedButton;
    OkButton: TSpeedButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NoButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure YesButtonClick(Sender: TObject);
  private

  public

  end;

var
  DKTextDialogForm: TDKTextDialogForm;

implementation

{$R *.lfm}

{ TDKTextDialogForm }

procedure TDKTextDialogForm.FormCreate(Sender: TObject);
begin
  DKDialogImages:= TDKDialogImages.Create(Self);
  DKDialogImages.ToButtons([OkButton, YesButton, NoButton, CancelButton]);
  DKDialogImages.ToMark(TImageList(Image.Images));
end;

procedure TDKTextDialogForm.FormShow(Sender: TObject);
begin
  if Caption='APP_TITLE' then
    Caption:= Application.Title;
end;

procedure TDKTextDialogForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TDKTextDialogForm.NoButtonClick(Sender: TObject);
begin
  ModalResult:= mrNo;
end;

procedure TDKTextDialogForm.OkButtonClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

procedure TDKTextDialogForm.YesButtonClick(Sender: TObject);
begin
  ModalResult:= mrYes;
end;

end.

