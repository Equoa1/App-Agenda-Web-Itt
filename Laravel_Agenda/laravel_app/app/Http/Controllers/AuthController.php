<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{


    public function editarperfil(Request $request, $username)
    {
        $user = User::where('matricula', $username)->first();
        if($user)
        { 
        $user->folio = $request->input('folio');
        $user->password = Hash::make($request->input('password'));
        $user->save();
        return redirect()->back()->with('success', 'Perfil actualizado exitosamente.');

        }
    
    else{
        return response()->json([], 400);

    }
    }
    
   public function exameninscrito($username)
{
    $existingInscripcion = DB::table('inscripcion')
        ->where('usuario_id', $username)
        ->first();

    if($existingInscripcion) {
        $examenesid = DB::select("
            SELECT i.*, e.hora
            FROM inscripcion i
            JOIN exam e ON i.examen_id = e.idexamen
            WHERE i.usuario_id = '$username'
        ");

        return response()->json($examenesid, 200);
    } else {
        return response()->json([], 404);
    }
}

    public function cancelarexamen($username)
    {
        $existingInscripcion = DB::table('inscripcion')
        ->where('usuario_id', $username)
        ->first();
        if($existingInscripcion)
        {
            DB::table('inscripcion')
            ->where('usuario_id',$username)
            ->delete();
          
            

        }
        else
        {
            
        }


    }

    public function register(Request $req)
    {
       
        $rules = [
            'folio' => 'required|string',
            'matricula' => 'required|string',
            'name' => 'required|string',
            'email' => 'required|string|unique:users',
            'password' => 'required|string|min:6',
            'carrera' => 'string',
            'apellidopaterno' => 'required|string',
            'apellidomaterno' => 'required|string',
            'genero' => 'required|string'
        ];
        $validator = Validator::make($req->all(), $rules);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
       
        $user = User::create([
            'folio' => $req->folio,
            'matricula' => $req->matricula,
            'name' => $req->name,
            'email' => $req->email,
            'password' => Hash::make($req->password),
            'carrera' => $req->carrera,
            'apellidopaterno' => $req->apellidopaterno,
            'apellidomaterno' => $req->apellidomaterno,
            'genero' => $req->genero,
           

        ]);
        $token = $user->createToken('Personal Access Token')->plainTextToken;
        $response = ['user' => $user, 'token' => $token];
        return response()->json($response, 200);
    }

    public function login(Request $req)
    {
        
        $rules = [
            'email' => 'required',
            'password' => 'required|string'
        ];
        $req->validate($rules);
      
        $user = User::where('email', $req->email)->first();
        
        if ($user && Hash::check($req->password, $user->password)) {
            $token = $user->createToken('Personal Access Token')->plainTextToken;
            $response = ['user' => $user, 'token' => $token];
            return response()->json($response, 200);
        }
        $response = ['message' => 'Contraseña incorrecta'];
        return response()->json($response, 400);
    }
    public function exam(Request $req)
    {
        $existingInscripcion = DB::table('inscripcion')
            ->where('usuario_id', $req->usuario_id)
            ->where('examen_id', $req->examen_id)
            ->first();
    
        if ($existingInscripcion) {
            return response()->json(['message' => 'El usuario ya está inscrito a un examen'], 400);
        } else {
            $hoy = date('Y-m-d');
            $examenes = DB::select("SELECT * FROM exam WHERE fechaexamen >= '$hoy'");
            return response()->json($examenes, 200);
        }
    }
    
    public function inscritos($username) {
        
        $inscritos = DB::table('inscripcion')
                    ->where('usuario_id', $username)
                    ->pluck('examen_id')
                    ->toArray();
    
        return response()->json($inscritos, 200);
    }
    
    public function inscribirse(Request $req)
{
    $rules = [
        'usuario_id' => 'required',
        'examen_id' => 'required',  
    ];
    $req->validate($rules);
   

    $existingInscripcion = DB::table('inscripcion')
        ->where('usuario_id', $req->usuario_id)
        ->where('examen_id', $req->examen_id)
        ->first();

    if ($existingInscripcion) {
        return response()->json(['message' => 'El usuario ya está inscrito en este examen.'], 400);
       
    }
    else{
        $user = DB::table('users')
        ->where('matricula', $req->input('usuario_id'))
        ->first();
        $cantidad = DB::table('inscripcion')
        ->where('examen_id', '=', $req->examen_id)
        ->count();


      

        DB::table('inscripcion')->insert([
        'udi' => $user->id,
        'carrera' => $user->carrera,
        'numerodecita' => $cantidad + 1,
        'usuario_id' => $req->usuario_id,
        'examen_id' => $req->examen_id,
        'fecha_examen' =>$req->fecha_examen,
        'created_at' => now(),
        'updated_at' => now(),
    ]);

    return response()->json(['message' => 'El usuario ha sido inscrito en el examen.'], 200);

    }
   
   

    
}

}