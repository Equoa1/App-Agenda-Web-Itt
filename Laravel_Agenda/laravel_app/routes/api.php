<?php

use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/auth/editarperfil/{username}', [AuthController::class,'editarperfil'])->name('Editarperfil');
Route::post('/auth/register', [AuthController::class, 'register']);
Route::post('/auth/login', [AuthController::class, 'login']);
Route::get('/auth/exam', [AuthController::class, 'exam']);
Route::post('/auth/inscribirse/', [AuthController::class, 'inscribirse']);
Route::get('/auth/inscritos/{username}', [AuthController::class, 'inscritos']);
Route::delete('/auth/cancelarexamen/{username}', [AuthController::class, 'cancelarexamen']);
Route::get('/auth/exameninscrito/{username}', [AuthController::class, 'exameninscrito']);



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
