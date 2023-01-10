<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBooks extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('books', function (Blueprint $table) {
            $table->increments('bookid');
            $table->string('bookname');
            $table->string('bookimageurl');
            $table->string('bookdescription');
            $table->integer('bookpages');
            $table->float('bookweight');
            $table->date('releasedate');
            $table->integer('nxbid');
            $table->integer('categoryid');
            $table->integer('quantity');
            $table->decimal('price', 10, 0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('books');
    }
}
