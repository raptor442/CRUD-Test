USING System
USING System.Collections.Generic
USING System.ComponentModel
USING System.Data
USING System.Drawing
USING System.Linq

USING System.Text
USING System.Threading.Tasks

USING System.Windows.Forms
USING DataAccess.XS.Interfaces
USING DataAccess.XS.Config
USING DataAccess.XS.Helpers
USING DataAccess.XS.Repositories
USING DataAccess.XS.Models
USING DataAccess.XS.Extensions

BEGIN NAMESPACE CRUD.UI.XS.WinForm

    PUBLIC PARTIAL CLASS CRUDXSForm ;
        INHERIT System.Windows.Forms.Form

        PROTECT userRepository AS IUserRepository
        PROTECT users AS List<User>
        
        PUBLIC CONSTRUCTOR()   STRICT//Form1
            InitializeComponent()
            
            LOCAL configSettings := ConfigSettings{} AS IConfigSettings
            LOCAL dbAccess := DBAccessHelper.GetSqlAccess(configSettings) AS ISqlAccess
            
            SELF:userRepository := UserRepository{dbAccess}
            
            VAR id := configSettings:ConnectionId
            SELF:Text += i" - {id}"
            RETURN
            
        
        PRIVATE ASYNC METHOD button1_Click(sender AS System.Object, e AS System.EventArgs) AS VOID STRICT
            // Create
            
            LOCAL user AS User
            
            user := User{}
            user:FirstName := SELF:tbFirstName:Text
            user:LastName := SELF:tbLastName:Text
            
            AWAIT SELF:userRepository:InsertUser(user)
            
            SELF:tbLastName:Text := ""
            SELF:tbFirstName:Text := ""
            
            SELF:LoadUsers()        
        RETURN
            
        
        PRIVATE ASYNC METHOD button3_Click(sender AS System.Object, e AS System.EventArgs) AS VOID STRICT
            // Update
            LOCAL selectedUser AS User
            
            selectedUser := (User)SELF:dataGridView1:CurrentRow?:DataBoundItem            
            IF selectedUser == null
                RETURN
            ENDIF
            
            selectedUser:FirstName := SELF:tbFirstName:Text
            selectedUser:LastName := SELF:tbLastName:Text
            
            AWAIT SELF:userRepository:UpdateUser(selectedUser)
            
            SELF:LoadUsers()
        RETURN
            
        
        PRIVATE ASYNC METHOD button4_Click(sender AS System.Object, e AS System.EventArgs) AS VOID STRICT
            // Delete
            
            LOCAL selectedUser AS User
            
            selectedUser := (User)SELF:dataGridView1:CurrentRow?:DataBoundItem            
            IF selectedUser == null
                RETURN
            ENDIF

            AWAIT SELF:userRepository:DeleteUser(selectedUser:Id)

            SELF:LoadUsers()
        RETURN
            
        
        PRIVATE METHOD button2_Click(sender AS System.Object, e AS System.EventArgs) AS VOID STRICT
            // Read
            SELF:LoadUsers()
        RETURN
            
        
        PRIVATE METHOD CRUDXSForm_Load(sender AS System.Object, e AS System.EventArgs) AS VOID STRICT
            // On Load Form
            SELF:LoadUsers()
        RETURN
            
        
        PRIVATE METHOD dataGridView1_SelectionChanged(sender AS System.Object, e AS System.EventArgs) AS VOID STRICT
            // data grid view selected row changed
            LOCAL selectedUser AS User
            
            selectedUser := (User)SELF:dataGridView1:CurrentRow:DataBoundItem
            
            SELF:lblID:Text := selectedUser:Id:ToString()
            SELF:tbFirstName:Text := selectedUser:FirstName
            SELF:tbLastName:Text := selectedUser:LastName
        RETURN

        PRIVATE ASYNC METHOD LoadUsers() AS VOID STRICT
            SELF:users := AWAIT SELF:userRepository:GetUsers()
            LOCAL codeAndDescriptionList AS List<ICodeAndDescription>
            
            codeAndDescriptionList:Seek("test", FALSE, FALSE)
            //(SELF:users AS List<ICodeAndDescription):Seek("test", FALSE, FALSE)
            SELF:dataGridView1:DataSource := null
            SELF:dataGridView1:DataSource := SELF:users        
        RETURN
        
    END CLASS 
END NAMESPACE
