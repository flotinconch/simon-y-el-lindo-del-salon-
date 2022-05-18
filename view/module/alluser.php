<?php
    
    require_once '../../controller/user.controller.php';
    require_once '../../model/dao/user.dao.php';
    require_once '../../model/dto/user.dto.php';
    require_once '../../model/conexion.php';
    class Reporte{

        private $pdf;

        public function __construct(){
                include 'vendor/fpdf.php';
                $this -> pdf = new FPDF();
                $this -> pdf->AddPage();

        }

        public function headReport(){
            // Logo
            $this -> pdf->Image('../img/img.jpg',10,8,33);
            // Arial bold 15
            $this -> pdf->SetFont('Arial','B',15);
            // Movernos a la derecha
            $this -> pdf->Cell(80);
            // Título
            $this -> pdf->Cell(30,10,'USUARIOS',0,0,'C');
            // Salto de línea
            $this -> pdf->Ln(20);
        }

        public function viewAll(){
            $this -> pdf->SetFont('Arial','B',16);
            

            try{
                $objDtoUser = new User();
                $objDaoUser = new UserModel($objDtoUser);
                $respon = $objDaoUser -> mldSearchAllUser() -> fetchAll();
            }catch(PDOException $e){
                echo "Ha ocurrido un error en controlador showall " . $e -> getMessage() ;
            }


            $this -> pdf -> Ln(30);
            foreach ($respon as $key => $value) {
                $this -> pdf->Cell(40,10,$value['USER']);
                $this -> pdf->Cell(40,10,$value['NAME']);
                $this -> pdf->Cell(40,10,$value['LASTNAME']);
                $this -> pdf -> Ln(10);
                
            }
            
        }

        public function footReport(){
            
            // Posición: a 1,5 cm del final
            $this -> pdf ->SetY(259);
            $this -> pdf ->SetX(180);
            // Arial italic 8
            $this -> pdf ->SetFont('Arial','I',8);
            // Número de página
            $this -> pdf ->Cell(0,10,'Page '.$this -> pdf ->PageNo().'/{nb}',0,0,'C');
            
            $this -> pdf->Output();
        }
        
    }
    $objView = new Reporte();
    $objView -> headReport(); 
    $objView -> viewAll(); 
    $objView -> footReport(); 



?>