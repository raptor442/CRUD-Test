BEGIN NAMESPACE CRUD.UI.XS.WinForm

    PUBLIC PARTIAL CLASS CRUDXSForm
    PROTECT dataGridView1 AS System.Windows.Forms.DataGridView
    PRIVATE lblID AS System.Windows.Forms.Label
    PRIVATE label2 AS System.Windows.Forms.Label
    PRIVATE label1 AS System.Windows.Forms.Label
    PRIVATE tbLastName AS System.Windows.Forms.TextBox
    PRIVATE tbFirstName AS System.Windows.Forms.TextBox
    PRIVATE button4 AS System.Windows.Forms.Button
    PRIVATE button3 AS System.Windows.Forms.Button
    PRIVATE button1 AS System.Windows.Forms.Button
    PRIVATE button2 AS System.Windows.Forms.Button
 

        /// <summary>
        /// Required designer variable.
        /// </summary>
        private components := NULL AS System.ComponentModel.IContainer

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected method Dispose(disposing as logic) as void  STRICT

            if (disposing .AND. (components != null))
                components:Dispose()
            endif
            Super:Dispose(disposing)
			return

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private METHOD InitializeComponent() AS VOID STRICT
            SELF:dataGridView1 := System.Windows.Forms.DataGridView{}
            SELF:lblID := System.Windows.Forms.Label{}
            SELF:label2 := System.Windows.Forms.Label{}
            SELF:label1 := System.Windows.Forms.Label{}
            SELF:tbLastName := System.Windows.Forms.TextBox{}
            SELF:tbFirstName := System.Windows.Forms.TextBox{}
            SELF:button4 := System.Windows.Forms.Button{}
            SELF:button3 := System.Windows.Forms.Button{}
            SELF:button1 := System.Windows.Forms.Button{}
            SELF:button2 := System.Windows.Forms.Button{}
            ((System.ComponentModel.ISupportInitialize)(SELF:dataGridView1)):BeginInit()
            SELF:SuspendLayout()
            // 
            // dataGridView1
            // 
            SELF:dataGridView1:AllowUserToAddRows := false
            SELF:dataGridView1:AllowUserToDeleteRows := false
            SELF:dataGridView1:AllowUserToResizeRows := false
            SELF:dataGridView1:ColumnHeadersHeightSizeMode := System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
            SELF:dataGridView1:Location := System.Drawing.Point{263, 11}
            SELF:dataGridView1:Margin := System.Windows.Forms.Padding{2}
            SELF:dataGridView1:MultiSelect := false
            SELF:dataGridView1:Name := "dataGridView1"
            SELF:dataGridView1:ReadOnly := true
            SELF:dataGridView1:RowHeadersWidth := 51
            SELF:dataGridView1:RowTemplate:Height := 24
            SELF:dataGridView1:SelectionMode := System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect
            SELF:dataGridView1:Size := System.Drawing.Size{398, 150}
            SELF:dataGridView1:TabIndex := 6
            SELF:dataGridView1:SelectionChanged += System.EventHandler{ SELF, @dataGridView1_SelectionChanged() }
            // 
            // lblID
            // 
            SELF:lblID:AutoSize := true
            SELF:lblID:Location := System.Drawing.Point{17, 7}
            SELF:lblID:Margin := System.Windows.Forms.Padding{2, 0, 2, 0}
            SELF:lblID:Name := "lblID"
            SELF:lblID:Size := System.Drawing.Size{17, 15}
            SELF:lblID:TabIndex := 14
            SELF:lblID:Text := "id"
            // 
            // label2
            // 
            SELF:label2:AutoSize := true
            SELF:label2:Location := System.Drawing.Point{17, 62}
            SELF:label2:Margin := System.Windows.Forms.Padding{2, 0, 2, 0}
            SELF:label2:Name := "label2"
            SELF:label2:Size := System.Drawing.Size{67, 15}
            SELF:label2:TabIndex := 13
            SELF:label2:Text := "LastName:"
            // 
            // label1
            // 
            SELF:label1:AutoSize := true
            SELF:label1:Location := System.Drawing.Point{17, 36}
            SELF:label1:Margin := System.Windows.Forms.Padding{2, 0, 2, 0}
            SELF:label1:Name := "label1"
            SELF:label1:Size := System.Drawing.Size{67, 15}
            SELF:label1:TabIndex := 12
            SELF:label1:Text := "FirstName:"
            // 
            // tbLastName
            // 
            SELF:tbLastName:Location := System.Drawing.Point{79, 58}
            SELF:tbLastName:Margin := System.Windows.Forms.Padding{2}
            SELF:tbLastName:Name := "tbLastName"
            SELF:tbLastName:Size := System.Drawing.Size{167, 20}
            SELF:tbLastName:TabIndex := 1
            // 
            // tbFirstName
            // 
            SELF:tbFirstName:Location := System.Drawing.Point{79, 35}
            SELF:tbFirstName:Margin := System.Windows.Forms.Padding{2}
            SELF:tbFirstName:Name := "tbFirstName"
            SELF:tbFirstName:Size := System.Drawing.Size{167, 20}
            SELF:tbFirstName:TabIndex := 0
            // 
            // button4
            // 
            SELF:button4:Location := System.Drawing.Point{188, 142}
            SELF:button4:Margin := System.Windows.Forms.Padding{2}
            SELF:button4:Name := "button4"
            SELF:button4:Size := System.Drawing.Size{56, 19}
            SELF:button4:TabIndex := 4
            SELF:button4:Text := "Delete"
            SELF:button4:UseVisualStyleBackColor := true
            SELF:button4:Click += System.EventHandler{ SELF, @button4_Click() }
            // 
            // button3
            // 
            SELF:button3:Location := System.Drawing.Point{79, 142}
            SELF:button3:Margin := System.Windows.Forms.Padding{2}
            SELF:button3:Name := "button3"
            SELF:button3:Size := System.Drawing.Size{56, 19}
            SELF:button3:TabIndex := 3
            SELF:button3:Text := "Update"
            SELF:button3:UseVisualStyleBackColor := true
            SELF:button3:Click += System.EventHandler{ SELF, @button3_Click() }
            // 
            // button1
            // 
            SELF:button1:Location := System.Drawing.Point{18, 142}
            SELF:button1:Margin := System.Windows.Forms.Padding{2}
            SELF:button1:Name := "button1"
            SELF:button1:Size := System.Drawing.Size{56, 19}
            SELF:button1:TabIndex := 2
            SELF:button1:Text := "Create"
            SELF:button1:UseVisualStyleBackColor := true
            SELF:button1:Click += System.EventHandler{ SELF, @button1_Click() }
            // 
            // button2
            // 
            SELF:button2:Location := System.Drawing.Point{605, 176}
            SELF:button2:Margin := System.Windows.Forms.Padding{2}
            SELF:button2:Name := "button2"
            SELF:button2:Size := System.Drawing.Size{56, 19}
            SELF:button2:TabIndex := 5
            SELF:button2:Text := "Read"
            SELF:button2:UseVisualStyleBackColor := true
            SELF:button2:Click += System.EventHandler{ SELF, @button2_Click() }
            // 
            // CRUDXSForm
            // 
            SELF:AutoScaleDimensions := System.Drawing.SizeF{6, 13}
            SELF:AutoScaleMode := System.Windows.Forms.AutoScaleMode.Font
            SELF:ClientSize := System.Drawing.Size{672, 206}
            SELF:Controls:Add(SELF:button2)
            SELF:Controls:Add(SELF:button4)
            SELF:Controls:Add(SELF:button3)
            SELF:Controls:Add(SELF:button1)
            SELF:Controls:Add(SELF:lblID)
            SELF:Controls:Add(SELF:label2)
            SELF:Controls:Add(SELF:label1)
            SELF:Controls:Add(SELF:tbLastName)
            SELF:Controls:Add(SELF:tbFirstName)
            SELF:Controls:Add(SELF:dataGridView1)
            SELF:MaximizeBox := false
            SELF:Name := "CRUDXSForm"
            SELF:StartPosition := System.Windows.Forms.FormStartPosition.CenterScreen
            SELF:Text := "Joe The CRUD (XS)"
            SELF:Load += System.EventHandler{ SELF, @CRUDXSForm_Load() }
            ((System.ComponentModel.ISupportInitialize)(SELF:dataGridView1)):EndInit()
            SELF:ResumeLayout(false)
            SELF:PerformLayout()

        #endregion
    END CLASS 
END NAMESPACE
