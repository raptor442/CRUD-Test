USING System
USING System.Collections.Generic
USING System.ComponentModel
USING System.Data
USING System.Drawing
USING System.Linq

USING System.Text
USING System.Threading.Tasks

USING System.Windows.Forms

BEGIN NAMESPACE CRUD.UI.XS.WinForm

    PUBLIC PARTIAL CLASS CRUDXSForm ;
        INHERIT System.Windows.Forms.Form

        PUBLIC CONSTRUCTOR()   STRICT//Form1
            InitializeComponent()
            RETURN
            
        
        PRIVATE METHOD button1_Click(sender AS System.Object, e AS System.EventArgs) AS VOID STRICT
            // Create
        RETURN
            
        
        PRIVATE METHOD button3_Click(sender AS System.Object, e AS System.EventArgs) AS VOID STRICT
            // Update
        RETURN
            
        
        PRIVATE METHOD button4_Click(sender AS System.Object, e AS System.EventArgs) AS VOID STRICT
            // Delete
        RETURN
            
        
        PRIVATE METHOD button2_Click(sender AS System.Object, e AS System.EventArgs) AS VOID STRICT
            // Read
        RETURN
            
        
        PRIVATE METHOD CRUDXSForm_Load(sender AS System.Object, e AS System.EventArgs) AS VOID STRICT
            // Load Form
        RETURN
            
        
        PRIVATE METHOD dataGridView1_SelectionChanged(sender AS System.Object, e AS System.EventArgs) AS VOID STRICT
            // data grid view selected row changed
        RETURN

    END CLASS 
END NAMESPACE
