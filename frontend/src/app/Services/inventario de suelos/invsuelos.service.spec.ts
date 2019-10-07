import { TestBed } from '@angular/core/testing';

import { InvsuelosService } from './invsuelos.service';

describe('InvsuelosService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: InvsuelosService = TestBed.get(InvsuelosService);
    expect(service).toBeTruthy();
  });
});
