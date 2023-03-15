<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{
    public function exameninscrito($username)
    {
        $existingInscripcion = DB::table('inscripcion')
        ->where('usuario_id', $username)
        ->first();
        if($existingInscripcion)
        {
            $examenesid = DB::select("SELECT * FROM inscripcion WHERE usuario_id = '$username'");
            return response()->json($examenesid,200);

        }
        else
        {
            $response = ['message' => 'No se ha registrado ningun examen'];
            return response()->json($response, 200);
        }


    }
    public function register(Request $req)
    {
       
        $rules = [
            'matricula' => 'required|string',
            'name' => 'required|string',
            'email' => 'required|string|unique:users',
            'password' => 'required|string|min:6'
        ];
        $validator = Validator::make($req->all(), $rules);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
       
        $user = User::create([
            'matricula' => $req->matricula,
            'name' => $req->name,
            'email' => $req->email,
            'password' => Hash::make($req->password)
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
        $response = ['message' => 'Incorrect email or password'];
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
        }
        else{
          
        $examenes = DB::select('SELECT * FROM exam');
        return response()->json($examenes,200);
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

    DB::table('inscripcion')->insert([
        'usuario_id' => $req->usuario_id,
        'examen_id' => $req->examen_id,
        'fecha_examen' =>$req->fecha_examen,
        'created_at' => now(),
        'updated_at' => now(),
    ]);

    return response()->json(['message' => 'El usuario ha sido inscrito en el examen.'], 200);
}

}
