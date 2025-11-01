unit DK_Dialogs;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, System.UITypes,

  DK_TextDialogForm;

  {ОКНО С ИНФОРМАЦИОННЫМ СООБЩЕНИЕМ
   Кнопки   : "Ок"
   Параметры:
     AInfo - текст сообщения
     ACaption - заголовок окна сообщения
     Если ACaption='APP_TITLE' - наименование приложения}
  procedure Inform(const AInfo: String; const ACaption: String = '');

  {ОКНО С ПРЕДУПРЕЖДЕНИЕМ
   Кнопки   : "Ок"
   Параметры:
     AWarn - текст сообщения
     ACaption - заголовок окна сообщения
     Если ACaption='APP_TITLE' - наименование приложения}
  procedure Warning(const AWarn: String; const ACaption: String = '');

  {ОКНО С СООБЩЕНИЕМ ОБ ОШИБКЕ
   Кнопки   : "Ок"
   Параметры:
     AError - текст сообщения
     ACaption - заголовок окна сообщения
     Если ACaption='APP_TITLE' - наименование приложения}
  procedure Error(const AError: String; const ACaption: String = '');

  {ОКНО С ЗАПРОСОМ
   Кнопки   : "Да" [Result=True], "Нет" [Result=False]
   Параметры:
     AQuestion - текст запроса
     ACaption - заголовок окна запроса
     Если ACaption='APP_TITLE' - наименование приложения}
  function Confirm(const AQuestion: String; const ACaption: String = ''): Boolean;

implementation

function TextFormOpen(const AImageIndex: Integer;
                      const AOKVisible, AYesVisible,
                            ANoVisible, ACancelVisible: Boolean;
                      const AText: String; const ACaption: String): TModalResult;
var
  Frm: TDKTextDialogForm;
begin
  Frm:= TDKTextDialogForm.Create(nil);
  try
    Frm.Caption:= ACaption;
    Frm.TextLabel.Caption:= AText;

    Frm.Image.ImageIndex:= AImageIndex;

    Frm.OkButton.Visible:= AOKVisible;
    Frm.YesButton.Visible:= AYesVisible;
    Frm.NoButton.Visible:= ANoVisible;
    Frm.CancelButton.Visible:= ACancelVisible;

    Result:= Frm.ShowModal;
  finally
    FreeAndNil(Frm);
  end;
end;

procedure Inform(const AInfo: String; const ACaption: String);
begin
  TextFormOpen(0,
               True{OK},
               False{Yes},
               False{No},
               False{Cancel},
               AInfo, ACaption);
end;

procedure Warning(const AWarn: String; const ACaption: String);
begin
  TextFormOpen(2,
               True{OK},
               False{Yes},
               False{No},
               False{Cancel},
               AWarn, ACaption);
end;

procedure Error(const AError: String; const ACaption: String);
begin
  TextFormOpen(3,
               True{OK},
               False{Yes},
               False{No},
               False{Cancel},
               AError, ACaption);
end;

function Confirm(const AQuestion: String; const ACaption: String = ''): Boolean;
begin
  Result:= TextFormOpen(1,
                        False{OK},
                        True{Yes},
                        True{No},
                        False{Cancel},
                        AQuestion, ACaption)=mrYes;
end;

end.

