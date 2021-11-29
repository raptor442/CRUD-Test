USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text
USING System.Windows.Forms

//USING CRUD.UI.XS.WinForm

BEGIN NAMESPACE CRUD.UI.XS.WinForm

[STAThread] ;
	FUNCTION Start() AS VOID
    
    Application.EnableVisualStyles()
    Application.SetCompatibleTextRenderingDefault( FALSE )
    Application.Run( CRUDXSForm{} )
   
    RETURN
	
END NAMESPACE


