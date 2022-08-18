//
//  ViewController.swift
//  API_App
//
//  Created by usuario on 16/8/22.
//

import UIKit

class ViewController: UIViewController {

    var data: [Photo] = []

    @IBOutlet weak var tableView: UITableView!
    var fotoSeleccionada: Photo!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.getPhotos()
    }

    func getPhotos() {
        DataBaseManager.shared.getPhotos { (photos, message) in
            if (message != nil) {
                print(message ?? "")
            } else if ((photos?.count ?? 0) > 0) {
                self.data = photos ?? []
                self.tableView.reloadData()
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detalle") {
            let vc = segue.destination as! DetailViewViewController
            vc.foto = self.fotoSeleccionada
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let photo = self.data [indexPath.row]
        cell.itemTitle.text = photo.title
        cell.imagen.load(url: photo.getThumbnailUrl()!)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.fotoSeleccionada = self.data [indexPath.row]
        self.performSegue(withIdentifier: "detalle", sender: self)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url)
            {
                if let image = UIImage(data: data)
                {
                    DispatchQueue.main.async {
                        self?.image = image

                    }
                }
            }
        }
    }
}

