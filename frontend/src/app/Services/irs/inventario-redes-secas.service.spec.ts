import { TestBed } from '@angular/core/testing';

import { IrsService } from './irs.service';

describe('InventarioRedesSecasService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: IrsService = TestBed.get(IrsService);
    expect(service).toBeTruthy();
  });
});
