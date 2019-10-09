import { TestBed } from '@angular/core/testing';

import { MinasService } from './Minas.service';

describe('MinasService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: MinasService = TestBed.get(MinasService);
    expect(service).toBeTruthy();
  });
});
