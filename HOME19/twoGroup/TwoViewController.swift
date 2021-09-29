//
//  TwoViewController.swift
//  HOME19
//
//  Created  Yaroslav on 26.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
// MARK: View -
protocol TwoViewProtocol: AnyObject {
    
    func updateTableView()
}

class TwoViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    
	var presenter: TwoPresenterProtocol = TwoPresenter()

	override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
        presenter.viewDidLoad()
        
        tableView.register(UINib(nibName: "MyCell", bundle: Bundle.main), forCellReuseIdentifier: "MyCell")
        
        
    }
    
    @IBAction func galleryButtonPressed() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
       
    }
}

extension TwoViewController: TwoViewProtocol {
    func updateTableView() {
        tableView.reloadData()
    }
    
    
}


extension TwoViewController: UITableViewDelegate{
    
}

extension TwoViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfImageArray()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? MyCell else { return UITableViewCell()
    }
    
        cell.update(with: presenter.elementInImageArray(for: indexPath ))
                
    return cell
    }
}

extension TwoViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        guard let stringImage = image.pngData() else { return }
        presenter.addImage(imageString: stringImage)
        
       
    }
    
}

