import { TestBed } from '@angular/core/testing';

import { InventarioRedesSecasService } from './inventario-redes-secas.service';

describe('InventarioRedesSecasService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: InventarioRedesSecasService = TestBed.get(InventarioRedesSecasService);
    expect(service).toBeTruthy();
  });
});
