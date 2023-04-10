pragma solidity ^0.5.2;

/*
@title SmartCertificate
@dev A contract for managing certificates by ID. Each certificate has a unique ID,
and consists of a name and description. Certificates can be added to the contract
with setCertificate, and retrieved using getCertificate or countCertificates.
The uniqueCertificate modifier ensures that no two certificates can have the same ID.
*/
contract SmartCertificate {
    //struct dengan nama "Certificate" yang berisi string "name" dan "description".
    struct Certificate{
        string name;
        string description;
    }
    //mapping struct "Certificate" menjadi "Certificates" yang diidentifikasi dengan data uint
    mapping (uint => Certificate) Certificates;
    //array yang menyimpan seluruh data ID milik Certificate
    address[] public CertificateAccts;

    event CertificateInfo(
        uint id,
        string name,
        string description
    );

/*
@dev modifier yang memastikan nilai id selalu unik.
@param _id id yang akan diperiksa.
*/    
    modifier uniqueCertificate(uint _id) {
    require(bytes(Certificates[_id].name).length == 0, "A Certificate with this ID already exists!");
        _;
    }

/**
@dev mendaftarkan sertifikat baru dengan menentukan id, name dan description.
Emits a CertificateAdded event.
@param _id id dari certificate.
@param _name nama penerima sertifikat.
@param _description deskripsi tujuan pengeluaran sertifikat.
*/
    function setCertificate(uint _id, string memory _name, string memory _description) public uniqueCertificate(_id) {
        Certificates[_id].name = _name;
        Certificates[_id].description = _description;
        CertificateAccts.push(address(uint160(_id)));
        emit CertificateInfo(_id, _name, _description);
    }

/*
@dev menampilkan informasi sertifikat berdasarkan ID certificate yang dicari.
@param _id ID certificate yang akan ditampilkan informasinya
@return informasi "name" dan "description" dari certificate yang ditampilkan.
*/
    function getCertificate(uint _id) view public returns(string memory, string memory){
        return(Certificates[_id].name, Certificates[_id].description);
    }

/*
@dev menampilkan jumlah sertifikat yang terdaftar.
@return jumlah sertifikat.
*/
    function countCertificates() view public returns(uint){
        return CertificateAccts.length;
    }
}